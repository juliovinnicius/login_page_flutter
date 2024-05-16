import '../../domain/entites/user_entity.dart';

abstract class ILoginLocalDataSource {
  Future<bool> loginUser({
    required UserEntity user,
  });
}
