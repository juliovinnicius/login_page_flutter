import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';

class SignupException extends AppException {
  SignupException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToStoreUserException extends SignupException {
  UnableToStoreUserException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}
