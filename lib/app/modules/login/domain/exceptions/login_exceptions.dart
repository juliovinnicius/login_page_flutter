import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';

class LoginException extends AppException {
  LoginException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToLoginException extends LoginException {
  UnableToLoginException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}
