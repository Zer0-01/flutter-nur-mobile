import 'package:flutter/material.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_app_bar_widget.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoaAppBarWidget(),
      body: const Center(
        child: Text('Doa'),
      ),
    );
  }
}
