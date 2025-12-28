import '../entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<void> createUserProfile(UserProfileEntity profile);

  Future<UserProfileEntity?> getUserProfile(String uid);

  Future<void> updateUserProfile(UserProfileEntity profile);
}
