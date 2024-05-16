import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/modules/login/data/datasources/login_local_datasource.dart';
import 'package:login_page_flutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:login_page_flutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:login_page_flutter/app/modules/login/infra/datasource/i_login_local_datasource.dart';
import 'package:login_page_flutter/app/modules/login/infra/repositories/login_repository.dart';
import 'package:login_page_flutter/app/modules/login/presentation/cubit/login_cubit.dart';
import 'package:login_page_flutter/app/modules/root_module.dart';

import '../../core/transitions/transitions.dart';
import 'presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [RootMoodule()];

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
