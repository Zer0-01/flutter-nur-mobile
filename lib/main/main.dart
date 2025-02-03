import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/configuration/app_logger.dart';
import 'package:flutter_nur_mobile/configuration/environment.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/bloc/doa_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/doa_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.configure(isProduction: false);
  final log = AppLogger.getLogger("main.dart");

  ProfileConstants.setEnvironment(Environment.dev);

  log.info("Starting App with env: {}", [Environment.dev.name]);
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
