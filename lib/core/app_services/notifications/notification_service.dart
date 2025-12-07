import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _local =
  FlutterLocalNotificationsPlugin();

  // تشغيل الإشعارات
  static Future<void> init() async {
    // 1. طلب إذن الإشعارات
    await _messaging.requestPermission();

    // 2. إعداد إشعارات ال foreground
    const AndroidInitializationSettings android =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings =
    InitializationSettings(android: android);

    await _local.initialize(settings);

    // 3. استقبال الإشعارات لو التطبيق مفتوح
    FirebaseMessaging.onMessage.listen((message) {
      _showNotification(message);
    });

    // 4. استقبال الإشعارات لما المستخدم يدوس على Notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint("🔔 Notification Clicked: ${message.data}");
    });

    // 5. لو التطبيق كان مقفول وفتح بسبب إشعار
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint("🚀 App opened from terminated state with data: ${initialMessage.data}");
    }
  }

  // إظهار الإشعار داخل التطبيق
  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'default_channel',
      'App Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails =
    NotificationDetails(android: androidDetails);

    await _local.show(
      message.hashCode,
      message.notification?.title ?? "New Notification",
      message.notification?.body ?? "",
      platformDetails,
      payload: message.data.toString(),
    );
  }
}
