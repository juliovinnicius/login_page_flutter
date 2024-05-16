import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/modules/root_module.dart';
import 'package:login_page_flutter/app/modules/signup/data/datasources/signup_local_datasource.dart';
import 'package:login_page_flutter/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:login_page_flutter/app/modules/signup/domain/usecases/store_user_usecase.dart';
import 'package:login_page_flutter/app/modules/signup/infra/datasource/i_signup_local_datasource.dart';
import 'package:login_page_flutter/app/modules/signup/infra/repositories/signup_repository.dart';
import 'package:login_page_flutter/app/modules/signup/presentation/cubit/signup_cubit.dart';

import '../../core/transitions/transitions.dart';
import 'presentation/pages/signup_page.dart';

class SignupModule extends Module {
  @override
  List<Module> get imports => [RootMoodule()];

  @override
  void binds(Injector i) {
    // Datasource
    i.addSingleton<ISignupLocalDataSource>(SignupLocalDatasource.new);

    //Repositories
    i.addSingleton<ISignupRepository>(SignupRepository.new);

    //Usecase
    i.addSingleton<IStoreUserUseCase>(StoreUserUseCase.new);

    //Cubit
    i.addSingleton(SignupCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SignupPage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
