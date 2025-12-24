import 'dart:io';

abstract class CloudinaryRemoteDataSource {
  Future<String> uploadImage(File imageFile, String folder);
}