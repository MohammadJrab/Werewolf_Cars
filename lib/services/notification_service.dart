// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'firebase_service.dart';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   FirebaseService.handleMessage(jsonDecode(notificationResponse.payload!));
// }

// class NotificationService {
//   NotificationService();

//   static final _localNotifications = FlutterLocalNotificationsPlugin();

//   static Future<void> initializePlatformNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('drawable/launcher_icon');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//             requestSoundPermission: true,
//             requestBadgePermission: true,
//             requestAlertPermission: true,
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await _localNotifications.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//       onDidReceiveNotificationResponse: notificationTapBackground,
//     );
//   }

//   static void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     if (kDebugMode) {
//       print('id $id');
//     }
//   }

//   static Future<NotificationDetails> _notificationDetails() async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'Werewolf-Cars',
//       'Werewolf Cars Notification',
//       groupKey: 'com.werewolf.werewolf_cars',
//       channelDescription: 'for receive notification',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//     );

//     DarwinNotificationDetails iosNotificationDetails =
//         const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     final details = await _localNotifications.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {}
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

//     return platformChannelSpecifics;
//   }

//   static Future<void> showLocalNotification({
//     required int id,
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     final platformChannelSpecifics = await _notificationDetails();
//     await _localNotifications.show(
//       id,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: payload,
//     );
//   }
// }
