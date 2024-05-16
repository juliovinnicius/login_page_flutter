import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/login/domain/dto/login_dto.dart';
import 'package:login_page_flutter/app/modules/login/domain/exceptions/login_exceptions.dart';
import 'package:login_page_flutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:login_page_flutter/app/modules/login/infra/datasource/i_login_local_datasource.dart';
import 'package:result_dart/result_dart.dart';

class LoginRepository implements ILoginRepository {
  final ILoginLocalDataSource _localDataSource;

  LoginRepository(this._localDataSource);

  @override
  AsyncResult<bool, AppException> loginUser(LoginDTO dto) async {
    try {
      final user = await _localDataSource.loginUser(user: dto.user);
      return Success(user);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToLoginException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
