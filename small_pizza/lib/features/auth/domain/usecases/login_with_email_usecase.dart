import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailUseCase {
  final AuthRepository repository;

   LoginWithEmailUseCase(this.repository);

  Future<UserEntity> call({
   required String email,
   required String password,

  }){
 return repository.loginWithEmail(email, password);
  }

}
