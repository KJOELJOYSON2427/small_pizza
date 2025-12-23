import 'package:small_pizza/features/auth/data/datasorces/user_profile_remote_data_source.dart';

import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../models/user_profile_model.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;

  UserProfileRepositoryImpl(this.remoteDataSource);

  @override
Future<void> createUserProfile(UserProfileEntity profile) {
  return remoteDataSource.createUserProfile(
    UserProfileModel(
      uid: profile.uid,
      name: profile.name,
      photoUrl: profile.photoUrl,
      mobile: profile.mobile,
      address: profile.address,
      createdAt: profile.createdAt,
      updatedAt: profile.updatedAt,
    ),
  );
}


  @override
  Future<UserProfileEntity?> getUserProfile(String uid) async {
    return await remoteDataSource.getUserProfile(uid);
  }

@override
Future<void> updateUserProfile(UserProfileEntity profile) {
  return remoteDataSource.updateUserProfile(
    UserProfileModel(
      uid: profile.uid,
      name: profile.name,
      photoUrl: profile.photoUrl,
      mobile: profile.mobile,
      address: profile.address,
      createdAt: profile.createdAt,
      updatedAt: DateTime.now(), // always update
    ),
  );
}

}
