import 'package:login_page_flutter/app/modules/home/data/adapters/person_adapter.dart';
import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';
import 'package:login_page_flutter/app/modules/home/domain/exceptions/home_exceptions.dart';
import 'package:login_page_flutter/app/modules/home/infra/datasource/i_person_datasource.dart';

import '../../../../core/configurations/routes/app_api_routes.dart';
import '../../../../core/exceptions/internal_server_exception.dart';
import '../../../../core/packages/http_client/abstractions/i_http_client.dart';

class PersonDatasource implements IPersonDatasource {
  final IHttpClient _httpClient;
  final AppApiRoutes _appApiRoutes;

  const PersonDatasource(this._httpClient, this._appApiRoutes);

  @override
  Future<PersonEntity> getPerson() async {
    final url = _appApiRoutes.getPersonDetails();

    final response = await _httpClient.get(url);

    switch (response.statusCode) {
      case 200:
        // final decodedResponse = json.decode(response.data);
        return PersonAdapter.fromJSON(response.data);
      case 400:
        throw UnableToGetPersonalDataException(
          description: 'Unable to get all pokemons',
        );
      default:
        throw InternalServerException(description: response.data);
    }
  }
}
