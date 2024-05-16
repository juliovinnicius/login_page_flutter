import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/Signup_dto.dart';
import '../entites/user_entity.dart';

abstract class ISignupRepository {
  AsyncResult<UserEntity, AppException> storeUser(SignupDTO dto);
}
