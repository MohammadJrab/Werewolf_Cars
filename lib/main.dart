import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/models/localization_config.dart';

import 'core/di/di_container.dart';
import 'core/initialization.dart';
import 'features/app/presentation/pages/app.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await configureDependencies();

//   debugPrint(
//       "onBackgroundMessage: notification **** ${message.notification?.toMap().toString()} ****"
//       "\n data *** ${message.data.toString()} ***");
// }
//hello
Future<void> main() async {
  await initialization(
    () => const App(),
    localizationConfig: LocalizationConfig(),
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}
