import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoaAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const DoaAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.doa),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
