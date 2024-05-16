import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/login_dto.dart';
import '../repositories/i_login_repository.dart';

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
