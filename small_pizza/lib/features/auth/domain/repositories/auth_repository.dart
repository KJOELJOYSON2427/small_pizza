import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
  Future<UserEntity> loginWithFacebook();
  Future<void> logout();

  Stream<UserEntity?> get authStateChanges;
}




