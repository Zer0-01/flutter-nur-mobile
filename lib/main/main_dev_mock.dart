import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nur_mobile/configuration/app_logger.dart';
import 'package:flutter_nur_mobile/configuration/environment.dart';
import 'package:flutter_nur_mobile/configuration/local_storage.dart';
import 'package:flutter_nur_mobile/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.configure(isProduction: false);
  final log = AppLogger.getLogger("main.dart");

  ProfileConstants.setEnvironment(Environment.dev_mock);

  log.info("Starting App with env: {}", [Environment.dev_mock.name]);

  const defaultLanguage = "en";
  AppLocalStorage().setStorage(StorageType.sharedPreferences);
  await AppLocalStorage().save(StorageKeys.language.name, defaultLanguage);

  const initialTheme = AdaptiveThemeMode.light;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App(language: defaultLanguage, initialTheme: initialTheme));
  });
}
