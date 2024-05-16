import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/signup/domain/dto/Signup_dto.dart';
import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';
import 'package:login_page_flutter/app/modules/signup/domain/exceptions/signup_exceptions.dart';
import 'package:login_page_flutter/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:login_page_flutter/app/modules/signup/infra/datasource/i_signup_local_datasource.dart';
import 'package:result_dart/result_dart.dart';

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
