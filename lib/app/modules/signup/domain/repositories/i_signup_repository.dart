import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/signup/domain/dto/Signup_dto.dart';
import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class ISignupRepository {
  AsyncResult<UserEntity, AppException> storeUser(SignupDTO dto);
}
