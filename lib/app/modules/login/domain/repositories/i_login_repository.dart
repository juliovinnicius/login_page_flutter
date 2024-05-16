import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/login_dto.dart';

abstract class ILoginRepository {
  AsyncResult<bool, AppException> loginUser(LoginDTO dto);
}
