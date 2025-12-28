import 'package:small_pizza/features/auth/data/models/user_profile_model.dart';

abstract class UserProfileRemoteDataSource {
Future<void> createUserProfile(UserProfileModel profile);
  Future<UserProfileModel?> getUserProfile(String uid);
  Future<void> updateUserProfile(UserProfileModel profile);
}
