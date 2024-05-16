import 'package:login_page_flutter/app/modules/signup/data/adapters/user_adapter.dart';
import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';
import 'package:login_page_flutter/app/modules/signup/infra/datasource/i_signup_local_datasource.dart';

import '../../../../core/packages/local_storage_service/abstraction/i_local_storage_service.dart';

class SignupLocalDatasource implements ISignupLocalDataSource {
  final ILocalStorageService _localStorageService;

  SignupLocalDatasource(this._localStorageService);

  @override
  Future<UserEntity> storeUser({required UserEntity user}) async {
    final containsUser = await _localStorageService.contains(
      key: 'USER',
    );
    final mapOfUser = <String, dynamic>{};

    if (containsUser) {
      final existingUsers = await _localStorageService.get(
        key: 'USER',
      );

      mapOfUser.addAll(existingUsers);
    }

    mapOfUser[user.email] = await UserAdapter.toMap(user);

    await _localStorageService.store(
      value: mapOfUser,
      key: 'USER',
    );

    return user;
  }
}
