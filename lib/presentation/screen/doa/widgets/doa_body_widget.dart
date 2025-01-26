import 'package:flutter/material.dart';

class DoaBodyWidget extends StatelessWidget {
  const DoaBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Doa'),
          subtitle: Text('Doa'),
          leading: Icon(Icons.abc),
          trailing: Icon(Icons.abc),
        );
      },
    );
  }
}
