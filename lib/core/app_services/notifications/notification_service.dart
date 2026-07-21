import 'package:easy_deal/core/extensions/log_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _local =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    /// ==============================
    /// 1) Request permissions (FCM)
    /// ==============================
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    /// ==============================
    /// 2) Local notifications setup
    /// ==============================

    /// Android
    const AndroidInitializationSettings android =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    /// iOS/macOS (MANDATORY ⚠️)
    const DarwinInitializationSettings ios =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    /// Combine both
    const InitializationSettings settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await _local.initialize(settings);

    /// ==============================
    /// 3) Foreground messages
    /// ==============================
    FirebaseMessaging.onMessage.listen((message) {
      _showNotification(message);
    });

    /// ==============================
    /// 4) When user taps notification
    /// ==============================
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      logSuccess("🔔 Notification Clicked: ${message.data}");
    });

    /// ==============================
    /// 5) Terminated state
    /// ==============================
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      logSuccess(
          "🚀 App opened from terminated state with data: ${initialMessage.data}");
    }
  }

  /// ==============================
  /// Show local notification
  /// ==============================
  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'default_channel',
      'App Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails =
    DarwinNotificationDetails();

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _local.show(
      message.hashCode,
      message.notification?.title ?? "New Notification",
      message.notification?.body ?? "",
      platformDetails,
      payload: message.data.toString(),
    );
  }
}