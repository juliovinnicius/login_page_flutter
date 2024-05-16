import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';

abstract class IHomeRepository {
  AsyncResult<PersonEntity, AppException> getPerson();
}
