import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/signup/domain/dto/Signup_dto.dart';
import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';
import 'package:login_page_flutter/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:result_dart/result_dart.dart';

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
