import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/bloc/doa_bloc.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_app_bar_widget.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_body_loading_widget.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_body_widget.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DoaBloc>().add(const OnInit());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const DoaAppBarWidget(),
      body: BlocBuilder<DoaBloc, DoaState>(
        builder: (context, state) {
          if (state is DoaLoading) {
            return const DoaBodyLoadingWidget();
          } else if (state is DoaSuccess) {
            return const DoaBodyWidget();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
