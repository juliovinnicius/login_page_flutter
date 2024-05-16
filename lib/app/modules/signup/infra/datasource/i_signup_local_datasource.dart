import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';

abstract class ISignupLocalDataSource {
  Future<UserEntity> storeUser({
    required UserEntity user,
  });
}
