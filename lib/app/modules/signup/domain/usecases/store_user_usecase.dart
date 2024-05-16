import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/Signup_dto.dart';
import '../entites/user_entity.dart';
import '../repositories/i_signup_repository.dart';

abstract class IStoreUserUseCase {
  AsyncResult<UserEntity, AppException> call(SignupDTO dto);
}

class StoreUserUseCase implements IStoreUserUseCase {
  final ISignupRepository _repository;

  StoreUserUseCase(this._repository);
  @override
  AsyncResult<UserEntity, AppException> call(SignupDTO dto) {
    return _repository.storeUser(dto);
  }
}
