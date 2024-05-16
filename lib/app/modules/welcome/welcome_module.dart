import 'package:flutter_modular/flutter_modular.dart';

import '../../core/transitions/transitions.dart';
import 'presentation/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const WelcomePage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
