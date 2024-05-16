import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../domain/dto/Signup_dto.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/exceptions/signup_exceptions.dart';
import '../../domain/repositories/i_signup_repository.dart';
import '../datasource/i_signup_local_datasource.dart';

class SignupRepository implements ISignupRepository {
  final ISignupLocalDataSource _localDataSource;

  SignupRepository(this._localDataSource);

  @override
  AsyncResult<UserEntity, AppException> storeUser(SignupDTO dto) async {
    try {
      final user = await _localDataSource.storeUser(user: dto.user);
      return Success(user);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToStoreUserException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
