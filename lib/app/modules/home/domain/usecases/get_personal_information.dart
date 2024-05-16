import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';
import 'package:login_page_flutter/app/modules/home/domain/repository/i_home_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';

abstract class IGetPersonalInformationUseCase {
  AsyncResult<PersonEntity, AppException> call();
}

class GetPersonalInformationUseCase implements IGetPersonalInformationUseCase {
  final IHomeRepository _repository;

  const GetPersonalInformationUseCase(this._repository);

  @override
  AsyncResult<PersonEntity, AppException> call() async {
    return _repository.getPerson();
  }
}
