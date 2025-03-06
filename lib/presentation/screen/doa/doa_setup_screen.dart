import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/bloc/doa_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/doa_screen.dart';

@RoutePage()
class DoaSetupScreen extends StatelessWidget {
  const DoaSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DoaBloc(), child: const DoaScreen());
  }
}
