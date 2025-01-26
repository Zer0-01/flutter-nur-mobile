import 'package:flutter/material.dart';

class DoaBodyLoadingWidget extends StatelessWidget {
  const DoaBodyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
