import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import '../../../my_app.dart';
import '../../utils/toast/toast.dart';

import '../../../features/layout/presentation/view_model/layout_cubit.dart';
import '../../app_services/local_services/cache_token.dart';
import '../../app_services/notifications/fcm_token_sync.dart';
import '../../utils/app_consts/session_cache.dart';

/// إعادة تشغيل الجلسة: أي دخول أو خروج يخلي التطبيق يبدأ من الأول.
///
/// المشكلة اللي بيحلها: الكيوبتس العامة (البروفايل، تعديل البروفايل،
/// المطوّرين...) متعمولة فوق الـ MaterialApp وبتعيش طول عمر التطبيق،
/// وكمان فيه حالة ستاتيك (تاب اللاي أوت، التوكن). فبعد تسجيل خروج ودخول
/// بأكونت تاني كان لازم تقفل التطبيق وتفتحه عشان كل حاجة تتحمّل من جديد.
///
/// بدل ما نفضل نفتكر كل كيوبت وكل متغير ستاتيك لازم يتصفّر، [epoch] بتتغيّر
/// فشجرة التطبيق كلها (المزوّدين + الـ MaterialApp + الـ Navigator) تتبني من
/// الأول — بالظبط زي فتح التطبيق، بس من غير سبلاش.
class AppSession {
  const AppSession._();

  /// بيزيد مع كل دخول/خروج. `MyApp` بتسمعه وبتعيد بناء الشجرة.
  static final ValueNotifier<int> epoch = ValueNotifier<int>(0);

  /// true لأول تشغيل بس: ساعتها بنبدأ من السبلاش (أونبوردنج/تحقق التوكن).
  static bool get isFirstLaunch => epoch.value == 0;

  /// بعد تسجيل دخول/تسجيل حساب ناجح (التوكن والهوية بيكونوا اتخزنوا قبل كده).
  static void signedIn() => _restart();

  /// تسجيل خروج: بنشيل التوكن وهوية الأكونت، وبعدين نبني التطبيق من الأول.
  static void signedOut() {
    // التوكن اللي في الذاكرة بيتصفّر على طول: أي حاجة بتقراه في نفس الفريم
    // (زي `initialRoute`) لازم تشوف إننا خرجنا.
    CacheTokenManger.userToken = null;
    /// نفس الجهاز ممكن يدخل بحساب تاني: لازم نسمح بإعادة إرسال نفس الـ
    /// FCM token بعد الدخول الجديد، وإلا السيرفر يفضل رابطه بالمستخدم القديم.
    FcmTokenSync.reset();
    _clearStorageThenRestart();
  }

  /// المسح من الستوريدج لازم يخلص قبل إعادة بناء الشجرة.
  ///
  /// `clearUserToken` و`SessionCache.clear` async، وقبل كده كانوا بيتنادوا
  /// من غير await:
  /// - التوكن في الـ secure storage: لو المستخدم قفل التطبيق في نفس اللحظة
  ///   كان المسح ممكن ميخلصش، وفتح التطبيق تاني بيلاقي التوكن في الستوريدج
  ///   (المتغير الستاتيك بيبدأ null في بروسيس جديدة) فيفتح على الرئيسية.
  /// - مفاتيح الهوية: الشجرة الجديدة بتعمل `ProfileCubit` وتقراها على طول،
  ///   فكانت تلاقي بيانات الأكونت القديم.
  static Future<void> _clearStorageThenRestart() async {
    try {
      await CacheTokenManger.clearUserToken();
      await SessionCache.clear();
    } finally {
      // حتى لو المسح رمى استثناء، الجلسة لازم تنتهي.
      CacheTokenManger.userToken = null;
      _restart();
    }
  }

  static void _restart() {
    // الحالة الستاتيك الوحيدة اللي بتعيش بره الشجرة.
    LayoutCubit.pageIndex = 0;

    // لو إحنا جوه فريم شغّال (مثلاً 401 جه وإحنا بنبني شاشة)، تغيير الـ
    // epoch وقتها معناه إعادة بناء وسط البناء. بنأجّله لآخر الفريم.
    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle ||
        phase == SchedulerPhase.postFrameCallbacks) {
      epoch.value++;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => epoch.value++);
    }
  }

  /// أقصى عدد فريمات نستنى فيها الشجرة الجديدة قبل ما نسيب الرسالة.
  static const int _maxToastAttempts = 90;

  /// بيعيد تشغيل الجلسة على طول، والرسالة بتظهر على الشاشة الجديدة بعد
  /// ما تتركّب.
  ///
  /// مينفعش نعرض التوست على الشاشة الحالية (يبان قبل الانتقال) ولا في نفس
  /// فريم إعادة البناء (الأوفرلاي بتاعه بيتشال قبل ما يبان، و`CherryToast`
  /// بتستخدم `overlay?.insert` فبتفشل في صمت). فبنستنى لحد ما [epoch]
  /// تزيد فعلاً والأوفرلاي الجديد يبقى جاهز.
  static void signedInWithMessage(String message) {
    final targetEpoch = epoch.value + 1;
    signedIn();
    _showWhenRestarted(message, targetEpoch, 0);
  }

  /// نفس فكرة [signedInWithMessage] بس لتسجيل الخروج.
  static void signedOutWithMessage(String message) {
    final targetEpoch = epoch.value + 1;
    signedOut();
    _showWhenRestarted(message, targetEpoch, 0);
  }

  static void _showWhenRestarted(String message, int targetEpoch, int attempt) {
    if (message.trim().isEmpty || attempt > _maxToastAttempts) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = MyApp.navigatorKey.currentState?.overlay;
      final isReady =
          epoch.value >= targetEpoch && overlay != null && overlay.mounted;
      if (!isReady) {
        _showWhenRestarted(message, targetEpoch, attempt + 1);
        // لو التطبيق وقف يرسم، الـ callback مش هتتنادى تاني، فبنطلب فريم
        // جديد عشان المحاولة تكمّل.
        WidgetsBinding.instance.scheduleFrame();
        return;
      }
      // context الأوفرلاي نفسه: `Navigator.of` بتلاقي الناڤيجيتور فوقه،
      // فالتوست بيتحط في أوفرلاي الشجرة الجديدة مش القديمة.
      Toast.showSuccessToast(msg: message, context: overlay.context);
    });
  }
}
