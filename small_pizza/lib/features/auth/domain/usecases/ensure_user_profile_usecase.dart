import '../entities/user_entity.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/user_profile_repository.dart';

class EnsureUserProfileUseCase {
  final UserProfileRepository repository;

  EnsureUserProfileUseCase(this.repository);

  Future<void> call(UserEntity user) async {
    final profile = await repository.getUserProfile(user.id);

    if (profile != null) return;

    await repository.createUserProfile(
      UserProfileEntity(
        uid: user.id,
        name: user.name ?? '',
        photoUrl: user.photoUrl,
        mobile: '',
        address: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }
}
