import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasorces/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  UserEntity _mapUser(User user) {
    return UserModel.fromFirebaseUser(user);
  }

  @override
  Future<UserEntity> loginWithEmail(String email, String password) async {
    final credential = await remote.loginWithEmail(email, password);

    return _mapUser(credential.user!);
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    final credential = await remote.loginWithGoogle();
    return _mapUser(credential.user!);
  }

  @override
  Future<void> logout() async {
    await remote.logout();
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return remote.authStateChanges.map((user) {
      if (user == null) return null;
      return _mapUser(user);
    });
  }
  
  @override
  Future<UserEntity> loginWithFacebook() async{
  final credential = await remote.loginWithFacebook();
    return _mapUser(credential.user!);
  }
}
