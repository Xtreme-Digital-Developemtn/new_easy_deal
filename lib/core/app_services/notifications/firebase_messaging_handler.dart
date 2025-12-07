// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class FirebaseMessagingHandler {
//   // Singleton pattern
//   static final FirebaseMessagingHandler _instance =
//       FirebaseMessagingHandler._internal();
//
//   factory FirebaseMessagingHandler() => _instance;
//
//   FirebaseMessagingHandler._internal();
//
//   // Instances
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//
//   // StreamController for notifications
//   final StreamController<RemoteMessage> _notificationStreamController =
//       StreamController<RemoteMessage>.broadcast();
//
//   Stream<RemoteMessage> get notificationStream =>
//       _notificationStreamController.stream;
//
//   // Initialization
//   Future<void> initialize({bool requestPermission = true}) async {
//     try {
//       // Initialize local notifications
//       await _initializeLocalNotifications();
//
//       // Request permission if needed
//       if (requestPermission) {
//         await _requestPermissions();
//       }
//
//       // Get FCM token
//       await _getToken();
//
//       // Set up foreground message handler
//       FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
//
//       // Set up background message handler
//       FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedApp);
//
//       // Handle when app is terminated
//       _handleTerminatedApp();
//
//       debugPrint('✅ Firebase Messaging initialized successfully');
//     } catch (error) {
//       debugPrint('❌ Error initializing Firebase Messaging: $error');
//     }
//   }
//
//   // Initialize local notifications
//   Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings(
//           requestAlertPermission: false,
//           requestBadgePermission: false,
//           requestSoundPermission: false,
//         );
//
//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//
//     await _localNotifications.initialize(settings);
//   }
//
//   // Request permissions
//   Future<void> _requestPermissions() async {
//     try {
//       NotificationSettings settings = await _firebaseMessaging
//           .requestPermission(
//             alert: true,
//             announcement: false,
//             badge: true,
//             carPlay: false,
//             criticalAlert: false,
//             provisional: false,
//             sound: true,
//           );
//
//       debugPrint('🔔 Permission status: ${settings.authorizationStatus}');
//     } catch (error) {
//       debugPrint('❌ Error requesting permission: $error');
//     }
//   }
//
//   // Get FCM token
//   Future<void> _getToken() async {
//     try {
//       String? token = await _firebaseMessaging.getToken();
//       if (token != null) {
//         debugPrint('📱 FCM Token: $token');
//         // هنا ممكن تخزن التوكن في SharedPreferences أو ترسله لسيرفرك
//         // await _saveTokenToServer(token);
//       }
//     } catch (error) {
//       debugPrint('❌ Error getting FCM token: $error');
//     }
//   }
//
//   // Handle foreground messages
//   Future<void> _handleForegroundMessage(RemoteMessage message) async {
//     debugPrint('📨 Foreground message received');
//
//     // Add to stream
//     _notificationStreamController.add(message);
//
//     // Show local notification
//     await _showLocalNotification(message);
//   }
//
//   // Show local notification
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//           'easy_deal_channel', // Channel ID
//           'Easy Deal Notifications', // Channel name
//           channelDescription: 'This channel is for Easy Deal notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//           showWhen: true,
//         );
//
//     const DarwinNotificationDetails iosPlatformChannelSpecifics =
//         DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         );
//
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iosPlatformChannelSpecifics,
//     );
//
//     await _localNotifications.show(
//       0, // Notification ID
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? 'You have a new message',
//       platformChannelSpecifics,
//       payload: message.data.toString(),
//     );
//   }
//
//   // Handle when user taps on notification (app in background)
//   Future<void> _handleOpenedApp(RemoteMessage message) async {
//     debugPrint('👆 Notification tapped while app in background');
//     _handleNotificationTap(message);
//   }
//
//   // Handle when app is terminated
//   Future<void> _handleTerminatedApp() async {
//     RemoteMessage? initialMessage = await _firebaseMessaging
//         .getInitialMessage();
//
//     if (initialMessage != null) {
//       debugPrint('🚀 App opened from terminated state by notification');
//       _handleNotificationTap(initialMessage);
//     }
//   }
//
//   // Handle notification tap
//   void _handleNotificationTap(RemoteMessage message) {
//     debugPrint('📍 Notification data: ${message.data}');
//
//     // هنا ممكن تتعامل مع البيانات حسب الـ data اللي جاية
//     // مثلاً: إذا في orderId روح لصفحة الـ order
//     // if (message.data['type'] == 'order') {
//     //   navigatorKey.currentState?.pushNamed('/order', arguments: message.data['orderId']);
//     // }
//   }
//
//   // Subscribe to topic
//   Future<void> subscribeToTopic(String topic) async {
//     try {
//       await _firebaseMessaging.subscribeToTopic(topic);
//       debugPrint('✅ Subscribed to topic: $topic');
//     } catch (error) {
//       debugPrint('❌ Error subscribing to topic: $error');
//     }
//   }
//
//   // Unsubscribe from topic
//   Future<void> unsubscribeFromTopic(String topic) async {
//     try {
//       await _firebaseMessaging.unsubscribeFromTopic(topic);
//       debugPrint('✅ Unsubscribed from topic: $topic');
//     } catch (error) {
//       debugPrint('❌ Error unsubscribing from topic: $error');
//     }
//   }
//
//   // Clear all notifications
//   Future<void> clearAllNotifications() async {
//     await _localNotifications.cancelAll();
//   }
//
//   // Get FCM token (for sending to server)
//   Future<String?> getFCMToken() async {
//     return await _firebaseMessaging.getToken();
//   }
//
//   // Dispose
//   void dispose() {
//     _notificationStreamController.close();
//   }
// }
