import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/core/transitions/transitions.dart';
import 'package:login_page_flutter/app/modules/login/login_module.dart';
import 'package:login_page_flutter/app/modules/welcome/welcome_module.dart';

class RootMoodule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: WelcomeModule(),
      transition: TransitionType.custom,
      customTransition: moduleTrasition,
    );
    r.module(
      '/login',
      module: LoginModule(),
      transition: TransitionType.custom,
      customTransition: moduleTrasition,
    );
  }
}
