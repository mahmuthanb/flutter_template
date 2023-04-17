import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsPageAppBarTitle),
      ),
      body: Column(children: [Container()]),
    );
  }
}
