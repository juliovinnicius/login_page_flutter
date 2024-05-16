import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/modules/home/data/datasource/person_datasource.dart';
import 'package:login_page_flutter/app/modules/home/domain/repository/i_home_repository.dart';
import 'package:login_page_flutter/app/modules/home/domain/usecases/get_personal_information.dart';
import 'package:login_page_flutter/app/modules/home/infra/datasource/i_person_datasource.dart';
import 'package:login_page_flutter/app/modules/home/infra/repository/home_repository.dart';
import 'package:login_page_flutter/app/modules/home/presentation/cubit/home_cubit.dart';

import '../../core/transitions/transitions.dart';
import '../root_module.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

  @override
  void binds(Injector i) {
    // Datasource
    i.addSingleton<IPersonDatasource>(PersonDatasource.new);

    //Repositories
    i.addSingleton<IHomeRepository>(HomeRepository.new);

    //Usecase
    i.addSingleton<IGetPersonalInformationUseCase>(GetPersonalInformationUseCase.new);

    //Cubit
    i.addSingleton(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
