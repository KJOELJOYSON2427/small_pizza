import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> loginWithEmail(String email, String password);

  Future<UserCredential> loginWithGoogle();
  Future<UserCredential> loginWithFacebook();

  Future<void> logout();

  Stream<User?> get authStateChanges;
  Future<UserCredential> registerWithEmail(
    String email,
    String password,
  );
}
