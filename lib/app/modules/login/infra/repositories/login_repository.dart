import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../domain/dto/login_dto.dart';
import '../../domain/exceptions/login_exceptions.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../datasource/i_login_local_datasource.dart';

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
