import 'package:dio/dio.dart';

import '../api/mother_profile_photo_api_service.dart';

class MotherProfilePhotoRepository {
  final MotherProfilePhotoApiService apiService;

  MotherProfilePhotoRepository(this.apiService);

  static const String baseImageUrl = "https://rafiq.runasp.net/";

  String _buildImageUrl(String path) {
    if (path.startsWith('http')) {
      return path;
    }

    return "$baseImageUrl$path";
  }

  Future<String> uploadProfileImage(
      String imagePath,
      ) async {
    final image = await MultipartFile.fromFile(
      imagePath,
      filename: imagePath.split('/').last,
    );

    final response =
    await apiService.uploadProfileImage(image);

    return _buildImageUrl(
      response.data.profileImageUrl,
    );
  }

  Future<void> deleteProfileImage() async {
    await apiService.deleteProfileImage();
  }

  Future<String?> getProfileImage() async {
    final response = await apiService.getProfileImage();

    final data = response.data as Map<String, dynamic>;

    final imageUrl = data['data']['profileImageUrl'];

    if (imageUrl == null) return null;

    return _buildImageUrl(imageUrl);
  }
}