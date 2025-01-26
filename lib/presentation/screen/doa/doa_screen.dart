import 'package:flutter/material.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_app_bar_widget.dart';
import 'package:flutter_nur_mobile/presentation/screen/doa/widgets/doa_body_widget.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DoaAppBarWidget(),
      body: DoaBodyWidget(),
    );
  }
}
