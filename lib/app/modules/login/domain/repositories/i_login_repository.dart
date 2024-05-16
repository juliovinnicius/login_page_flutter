import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/login/domain/dto/login_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract class ILoginRepository {
  AsyncResult<bool, AppException> loginUser(LoginDTO dto);
}
