import 'package:login_page_flutter/app/core/exceptions/app_exception.dart';
import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';
import 'package:login_page_flutter/app/modules/home/domain/exceptions/home_exceptions.dart';
import 'package:login_page_flutter/app/modules/home/domain/repository/i_home_repository.dart';
import 'package:login_page_flutter/app/modules/home/infra/datasource/i_person_datasource.dart';
import 'package:result_dart/result_dart.dart';

class HomeRepository implements IHomeRepository {
  final IPersonDatasource _datasource;

  HomeRepository(this._datasource);

  @override
  AsyncResult<PersonEntity, AppException> getPerson() async {
    try {
      final person = await _datasource.getPerson();
      return Success(person);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToGetPersonalDataException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
