import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithFacebookUseCase {
  final AuthRepository repository;

  LoginWithFacebookUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.loginWithFacebook();
  }
}
