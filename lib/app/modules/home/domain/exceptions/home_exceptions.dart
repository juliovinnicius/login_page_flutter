import '../../../../core/exceptions/app_exception.dart';

class HomeException extends AppException {
  HomeException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToGetPersonalDataException extends HomeException {
  UnableToGetPersonalDataException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}
