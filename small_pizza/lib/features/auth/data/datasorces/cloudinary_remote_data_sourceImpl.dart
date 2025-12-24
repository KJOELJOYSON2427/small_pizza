import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:small_pizza/features/auth/data/datasorces/cloudinary_remote_data_source.dart';

class CloudinaryRemoteDataSourceImpl implements CloudinaryRemoteDataSource {
  final CloudinaryPublic cloudinary;

  CloudinaryRemoteDataSourceImpl(this.cloudinary);

  @override
  Future<String> uploadImage(imageFile, String folder) async {
    try {
      final response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imageFile.path,
          folder: folder,
          resourceType: CloudinaryResourceType.Image,
        ),
      );

      return response.secureUrl;
    } catch (e) {
      throw Exception('Failed to upload image to Cloudinary: $e');
    }
  }
}
