import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/configuration/app_logger.dart';
import 'package:flutter_nur_mobile/configuration/environment.dart';
import 'package:flutter_nur_mobile/configuration/local_storage.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/bloc/doa_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/doa_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_nur_mobile/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.configure(isProduction: false);
  final log = AppLogger.getLogger("main.dart");

  ProfileConstants.setEnvironment(Environment.dev);

  log.info("Starting App with env: {}", [Environment.dev.name]);

  const defaultLanguage = "en";
  AppLocalStorage().setStorage(StorageType.sharedPreferences);
  await AppLocalStorage().save(StorageKeys.language.name, defaultLanguage);

  AppRouter().setRouter(RouterType.goRouter);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoaBloc()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: DoaScreen(),
      ),
    );
  }
}
