// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get_it/get_it.dart';
// import '../../firebase_options.dart';
// import 'notification_service.dart';

// class FirebaseService {
//   static Future<void> initialize() async {
//     if (Platform.isIOS || Platform.isMacOS) {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//         name: "WerewolfCars",
//       );
//     } else {
//       await Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform);
//     }
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             alert: true, badge: true, sound: true);
//     await NotificationService.initializePlatformNotifications();
//   }

//   static Future<String?> getFcmToken() async {
//     try {
//       await FirebaseMessaging.instance.requestPermission();

//       final fcmToken = await FirebaseMessaging.instance.getToken();

//       debugPrint("fcmToken: $fcmToken");

//       return fcmToken;
//     } catch (e) {
//       return null;
//     }
//   }

//   static void onMessage({required ValueChanged<RemoteMessage> listen}) {
//     FirebaseMessaging.onMessage.listen((message) {
//       debugPrint(
//           "onMessage: notification **** ${message.notification?.toMap().toString()} ****"
//           "\n data *** ${message.data.toString()} ***");
//       listen(message);
//     });
//   }

//   static Future<void> setupInteractedMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       handleMessage(initialMessage.data);
//     }

//     FirebaseMessaging.onMessageOpenedApp
//         .listen((event) => handleMessage(event.data));
//   }

//   static void handleMessage(Map<String, dynamic> data) {
//     final carId = int.parse(data["action_id"]);
//     // GetIt.I<MyCarsBloc>()
//     //     .add(HandleNotification( carId: carId));
//   }

//   static Future<void> deleteFcmToken() async {
//     return await FirebaseMessaging.instance.deleteToken();
//   }
// }
