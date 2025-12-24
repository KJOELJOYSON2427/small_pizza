import 'dart:io';

import 'package:small_pizza/features/auth/data/datasorces/cloudinary_remote_data_source.dart';
import 'package:small_pizza/features/auth/domain/repositories/cloudinary_repository.dart';

class CloudinaryRepositoryImpl implements CloudinaryRepository {
  final CloudinaryRemoteDataSource remoteDataSource;

  CloudinaryRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> uploadProfileImage(File imageFile, String userId) async {
    try {
      final imageUrl = await remoteDataSource.uploadImage(
        imageFile,
        'profile_photos',
      );

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload profile image: $e');
    }
  }
}
