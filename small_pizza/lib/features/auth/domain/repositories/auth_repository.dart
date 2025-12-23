import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
  Future<UserEntity> loginWithFacebook();
  Future<UserEntity> registerWithEmail(
    String email,
    String password,
  );
  Future<void> logout();

  Stream<UserEntity?> get authStateChanges;
}




