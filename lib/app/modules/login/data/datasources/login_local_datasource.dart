import '../../../../core/packages/local_storage_service/abstraction/i_local_storage_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../infra/datasource/i_login_local_datasource.dart';

class LoginLocalDatasource implements ILoginLocalDataSource {
  final ILocalStorageService _localStorageService;

  LoginLocalDatasource(this._localStorageService);

  @override
  Future<bool> loginUser({required UserEntity user}) async {
    final containsUsers = await _localStorageService.contains(
      key: 'USER',
    );

    final mapOfUsers = <String, dynamic>{};

    if (containsUsers) {
      final existingUsers = await _localStorageService.get(
        key: 'USER',
      );

      mapOfUsers.addAll(existingUsers);
    }

    if (mapOfUsers.containsKey(user.email)) {
      if (mapOfUsers[user.email]['pass'] == user.pass) {
        return true;
      }
      return false;
    }
    return false;
    // mapOfUsers[user.email] = await UserLoginAdapter.toMap(user);
  }
}
