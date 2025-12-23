import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:small_pizza/features/auth/data/datasorces/user_profile_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/models/user_profile_model.dart';

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final FirebaseFirestore firestore;

  UserProfileRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> createUserProfile(UserProfileModel profile) async {
    await firestore
        .collection('users')
        .doc(profile.uid)
        .set(profile.toJson(), SetOptions(merge: true));
  }

  @override
  Future<UserProfileModel?> getUserProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;


    return UserProfileModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUserProfile(UserProfileModel profile) async {
    await firestore
        .collection('users')
        .doc(profile.uid)
        .update(profile.toJson());
  }
}
