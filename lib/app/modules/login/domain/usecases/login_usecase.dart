import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/login/domain/dto/login_dto.dart';
import 'package:login_page_flutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class ILoginUserUseCase {
  AsyncResult<bool, AppException> call(LoginDTO dto);
}

class LoginUserUseCase implements ILoginUserUseCase {
  final ILoginRepository _repository;

  LoginUserUseCase(this._repository);
  @override
  AsyncResult<bool, AppException> call(LoginDTO dto) {
    return _repository.loginUser(dto);
  }
}
