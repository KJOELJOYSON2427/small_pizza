import 'dart:io';

abstract class CloudinaryRepository {
  Future<String> uploadProfileImage(File imageFile, String userId);
}