import '../../domain/entites/user_entity.dart';

abstract class ISignupLocalDataSource {
  Future<UserEntity> storeUser({
    required UserEntity user,
  });
}
