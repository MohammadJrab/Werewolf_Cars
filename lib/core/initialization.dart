import 'dart:async';
import 'package:flutter/services.dart';
import 'package:werewolf_cars/core/models/localization_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import 'di/di_container.dart';

Future<void> initialization(
  FutureOr<Widget> Function() builder, {
  LocalizationConfig? localizationConfig,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // await FirebaseService.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final Widget app;
  if (localizationConfig != null) {
    app = await _easyLocalization(builder, localizationConfig);
  } else {
    app = await builder();
  }

  runApp(app);
}

Future<EasyLocalization> _easyLocalization(
  FutureOr<Widget> Function() builder,
  LocalizationConfig localizationConfig,
) async {
  await EasyLocalization.ensureInitialized();
  String systemLanguageCode =
      WidgetsBinding.instance.platformDispatcher.locale.languageCode;

  return EasyLocalization(
    supportedLocales: localizationConfig.supportedLocales,
    useOnlyLangCode: localizationConfig.useOnlyLangCode,
    saveLocale: localizationConfig.saveLocale,
    startLocale: localizationConfig.startLocale,
    fallbackLocale: systemLanguageCode == "en" || systemLanguageCode == "ar"
        ? Locale(systemLanguageCode)
        : const Locale('en'),
    useFallbackTranslations: localizationConfig.useFallbackTranslations,
    path: localizationConfig.path,
    child: await builder(),
  );
}
