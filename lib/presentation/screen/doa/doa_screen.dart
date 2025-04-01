import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/bloc/doa_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_app_bar_widget.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_body_loading_widget.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_body_widget.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({super.key});

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoaBloc>().add(const OnInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: const DoaAppBarWidget(),
      body: BlocBuilder<DoaBloc, DoaState>(
        builder: (context, state) {
          switch (state.status) {
            case DoaStatus.initial:
            case DoaStatus.loading:
              return const CircularProgressIndicator();
            case DoaStatus.error:
              return Text("Error");
            case DoaStatus.success:
              return Text("SUccess");
          }
        },
      ),
    );
  }
}
