import 'package:flutter/material.dart';
import 'package:flutter_template/core/res/theme.dart';
import 'package:flutter_template/core/router.dart';
import 'package:flutter_template/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router(),
    );
  }
}
