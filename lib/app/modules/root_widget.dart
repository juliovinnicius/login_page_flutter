import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/themes/app_theme.dart';

class RootWidgetModule extends StatefulWidget {
  const RootWidgetModule({super.key});

  @override
  State<RootWidgetModule> createState() => _RootWidgetModuleState();
}

class _RootWidgetModuleState extends State<RootWidgetModule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: appTheme,
    );
  }
}
