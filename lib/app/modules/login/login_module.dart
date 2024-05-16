import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/core/transitions/transitions.dart';
import 'package:login_page_flutter/app/modules/login/presentation/login_page.dart';

class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const LoginPage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
