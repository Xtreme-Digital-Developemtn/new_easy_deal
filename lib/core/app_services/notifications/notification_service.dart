import 'dart:convert';
import 'dart:io';

import 'package:easy_deal/core/extensions/log_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../firebase_options.dart';
import '../../../main_imports.dart';
import '../../../my_app.dart';
import 'fcm_token_sync.dart';

/// معرّف القناة. لازم يطابق:
/// - `com.google.firebase.messaging.default_notification_channel_id` في المانيفست
/// - و`android.notification.channel_id` اللي الباك اند بيبعته في الـ payload
const String kDefaultChannelId = 'default_channel';
const String kDefaultChannelName = 'App Notifications';

/// هاندلر الباكجراوند لازم يكون top-level ومعلّم بـ `vm:entry-point`،
/// لأن فلاتر بيشغّله في أيزوليت منفصل (مش بيشوف أي حالة من أيزوليت الأب).
///
/// بيشتغل في حالتين: الأب في الخلفية أو مقفول.
/// لو الرسالة فيها `notification` فالنظام نفسه بيرسمها — بنسيبها.
/// لو data-only فمفيش حد بيرسمها، وده كان سبب إن الإشعارات
/// "تتبعت بنجاح" من فايربيز ومحدش يشوف حاجة.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (message.notification != null) return;
    await NotificationService.showFromMessage(message);
  } catch (error, stack) {
    debugPrint('background message handler failed: $error\n$stack');
  }
}

class NotificationService {
  NotificationService._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();

  /// ستاتيك لكل أيزوليت: أيزوليت الباكجراوند بيبدأ بـ false فبيعمل init لنفسه.
  static bool _localReady = false;

  static Future<void> init() async {
    /// 1) هاندلر الباكجراوند — لازم يتسجّل من الأيزوليت الرئيسي.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    /// 2) الصلاحيات (أندرويد 13+ كمان بيطلب POST_NOTIFICATIONS من هنا).
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    logSuccess('Notification permission: ${settings.authorizationStatus}');

    /// 3) الإشعارات المحلية + القناة.
    await _ensureLocalReady();

    /// 4) iOS: بنوقف عرض النظام في الفورجراوند عشان منعرضهاش مرتين
    /// (إحنا بنرسمها محليًا).
    if (Platform.isIOS) {
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: false,
        badge: true,
        sound: false,
      );
    }

    /// 5) التوكن: بنجيبه ونخزنه، وبنتابع أي تغيير بعد كده.
    /// غياب `onTokenRefresh` كان بيخلي السيرفر ماسك توكن قديم
    /// فـ FCM يرجّع UNREGISTERED والإشعار يضيع بدون خطأ ظاهر.
    await refreshToken();
    _messaging.onTokenRefresh.listen(
      (token) async {
        logSuccess('FCM token refreshed');
        await _saveToken(token);
        await FcmTokenSync.sync(force: true);
      },
      onError: (error) => logError('onTokenRefresh: $error'),
    );

    /// 6) رسائل الفورجراوند.
    FirebaseMessaging.onMessage.listen(showFromMessage);

    /// 7) فتح الأب من إشعار (الأب كان في الخلفية).
    FirebaseMessaging.onMessageOpenedApp.listen(_handleTap);

    /// 8) فتح الأب من إشعار والأب كان مقفول.
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage);
    }
  }

  /// جلب التوكن وتخزينه. على iOS لازم APNs token يوصل الأول،
  /// وإلا `getToken()` بيرمي استثناء.
  static Future<String?> refreshToken() async {
    try {
      if (Platform.isIOS) {
        final apns = await _messaging.getAPNSToken();
        if (apns == null) {
          logWarning('APNs token لسه مش جاهز — هنعتمد على onTokenRefresh');
          return null;
        }
      }
      final token = await _messaging.getToken();
      if (token == null || token.isEmpty) {
        logError('FCM token رجع فاضي');
        return null;
      }
      logSuccess('FCM Token: $token');
      await _saveToken(token);
      return token;
    } catch (error) {
      logError('getToken failed: $error');
      return null;
    }
  }

  /// التوكن المخزّن، ولو مش موجود بيحاول يجيبه من جديد.
  static Future<String?> currentToken() async {
    final cached = CacheHelper.getData(key: StorageKeys.fcmToken);
    if (cached is String && cached.isNotEmpty) return cached;
    return refreshToken();
  }

  static Future<void> _saveToken(String token) async {
    await CacheHelper.saveData(key: StorageKeys.fcmToken, value: token);
  }

  static Future<void> _ensureLocalReady() async {
    if (_localReady) return;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _local.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: _handleLocalTap,
    );

    /// بننشئ القناة صريح بأهمية عالية بدل ما نستنى أول `show()`،
    /// عشان إشعارات الباكجراوند اللي النظام بيرسمها تلاقي القناة موجودة
    /// بدل ما تنزل على الـ fallback channel بأهمية واطية.
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            kDefaultChannelId,
            kDefaultChannelName,
            importance: Importance.max,
            playSound: true,
          ),
        );

    _localReady = true;
  }

  /// بيرسم إشعار محلي من رسالة FCM.
  ///
  /// بياخد العنوان/النص من `notification` ولو مش موجودة (data-only)
  /// بيرجع لـ `data['title'] / data['body']`. لو مفيش ولا ده ولا ده
  /// فالرسالة صامتة ومش بنرسم حاجة بدل ما نعرض "New Notification" فاضي.
  static Future<void> showFromMessage(RemoteMessage message) async {
    await _ensureLocalReady();

    final data = message.data;
    final title =
        message.notification?.title ??
        (data['title'] ?? data['Title'])?.toString();
    final body =
        message.notification?.body ??
        (data['body'] ?? data['message'] ?? data['Body'])?.toString();

    if ((title == null || title.isEmpty) && (body == null || body.isEmpty)) {
      logWarning('رسالة بدون عنوان/نص — مش هنعرض إشعار: $data');
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      kDefaultChannelId,
      kDefaultChannelName,
      importance: Importance.max,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();

    await _local.show(
      message.hashCode,
      title ?? '',
      body ?? '',
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: jsonEncode(data),
    );
  }

  static void _handleLocalTap(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      _openFromData(data);
    } catch (error) {
      logError('payload غير صالح: $error');
    }
  }

  static void _handleTap(RemoteMessage message) {
    logSuccess('Notification tapped: ${message.data}');
    _openFromData(message.data);
  }

  /// فتح شاشة الإشعارات عند الضغط.
  ///
  /// لو الباك اند بعت `type`/`id` في الـ data ينفع نتفرّع منها لشاشات
  /// تانية من هنا بدون تغيير في باقي الكود.
  static void _openFromData(Map<String, dynamic> data) {
    final navigator = MyApp.navigatorKey.currentState;
    if (navigator == null) return;
    navigator.pushNamed(Routes.notificationsView);
  }

  static Future<void> clearAll() async {
    await _ensureLocalReady();
    await _local.cancelAll();
  }
}
