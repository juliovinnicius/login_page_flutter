import 'package:flutter_modular/flutter_modular.dart';

import '../core/packages/local_storage_service/abstraction/i_local_storage_service.dart';
import '../core/packages/local_storage_service/implemetation/local_storage_service.dart';
import '../core/transitions/transitions.dart';
import 'login/login_module.dart';
import 'signup/signup_module.dart';
import 'welcome/welcome_module.dart';

class RootMoodule extends Module {
  @override
  void binds(Injector i) {
    // Local Storage
    i.addSingleton<ILocalStorageService>(LocalStorageService.new);
  }

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
    r.module(
      '/signup',
      module: SignupModule(),
      transition: TransitionType.custom,
      customTransition: moduleTrasition,
    );
  }
}
