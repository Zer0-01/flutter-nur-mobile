import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final String language;
  final AdaptiveThemeMode initialTheme;
  App({super.key, required this.language, required this.initialTheme});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return buildNurApp();
  }

  AdaptiveTheme buildNurApp() {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      debugShowFloatingThemeButton: false,
      initial: initialTheme,
      builder: (light, dark) => _buildMultiBlocProvider(light, dark),
    );
  }

  ThemeData _buildLightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green, brightness: Brightness.light),
      );

  ThemeData _buildDarkTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red, brightness: Brightness.dark));

  MaterialApp _buildMultiBlocProvider(ThemeData light, ThemeData dark) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: light,
      darkTheme: dark,
    );
  }
}
