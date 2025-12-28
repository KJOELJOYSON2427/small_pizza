import '../entities/user_profile_entity.dart';
import '../repositories/user_profile_repository.dart';

class UpdateUserProfileUseCase {
  final UserProfileRepository repository;

  UpdateUserProfileUseCase(this.repository);

  Future<void> call(UserProfileEntity profile) {
    return repository.updateUserProfile(profile);
  }
}
