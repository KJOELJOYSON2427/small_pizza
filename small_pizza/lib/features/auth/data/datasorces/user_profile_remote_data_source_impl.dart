import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:small_pizza/features/auth/data/datasorces/user_profile_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/models/user_profile_model.dart';
import 'package:small_pizza/features/auth/domain/repositories/cloudinary_repository.dart';

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final FirebaseFirestore firestore;
  final CloudinaryRepository cloudinaryRepository;

  UserProfileRemoteDataSourceImpl(
    this.firestore, {
    required this.cloudinaryRepository,
  });

  @override
  Future<void> createUserProfile(UserProfileModel profile) async {
    try {
      String? uploadedPhotoUrl;

 // If photoUrl is a local file path, upload to Cloudinary
   if(profile.photoUrl != null && profile.photoUrl!.isNotEmpty && 
   !profile.photoUrl!.startsWith('http')
   ){
          final imageFile = File(profile.photoUrl!);
          if(await imageFile.exists()){
            uploadedPhotoUrl = await cloudinaryRepository.uploadProfileImage(
            imageFile,
            profile.uid,
          );
          }
   }
    // Create updated profile with Cloudinary URL
    final updatedProfile  = profile.copyWith(
        photoUrl: uploadedPhotoUrl ?? profile.photoUrl,
      );
       await firestore
        .collection('users')
        .doc(updatedProfile.uid)
        .set(updatedProfile.toJson(), SetOptions(merge: true));

    } catch (e) {
      throw Exception('Failed to create user profile: $e');
    }
   
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
