import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';

abstract class IPersonDatasource {
  Future<PersonEntity> getPerson();
}
