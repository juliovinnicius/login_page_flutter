import 'package:flutter_modular/flutter_modular.dart';

import '../../core/transitions/transitions.dart';
import '../root_module.dart';
import 'data/datasources/login_local_datasource.dart';
import 'domain/repositories/i_login_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'infra/datasource/i_login_local_datasource.dart';
import 'infra/repositories/login_repository.dart';
import 'presentation/cubit/login_cubit.dart';
import 'presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

  @override
  void binds(Injector i) {
    // Datasource
    i.addSingleton<ILoginLocalDataSource>(LoginLocalDatasource.new);

    //Repositories
    i.addSingleton<ILoginRepository>(LoginRepository.new);

    //Usecase
    i.addSingleton<ILoginUserUseCase>(LoginUserUseCase.new);

    //Cubit
    i.addSingleton(LoginCubit.new);
  }

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
