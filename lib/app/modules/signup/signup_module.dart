import 'package:flutter_modular/flutter_modular.dart';

import '../../core/transitions/transitions.dart';
import '../root_module.dart';
import 'data/datasources/signup_local_datasource.dart';
import 'domain/repositories/i_signup_repository.dart';
import 'domain/usecases/store_user_usecase.dart';
import 'infra/datasource/i_signup_local_datasource.dart';
import 'infra/repositories/signup_repository.dart';
import 'presentation/cubit/signup_cubit.dart';
import 'presentation/pages/signup_page.dart';

class SignupModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

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
