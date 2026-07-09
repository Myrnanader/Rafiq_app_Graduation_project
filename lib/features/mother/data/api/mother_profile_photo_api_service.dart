import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/upload_profile_image_response.dart';

part 'mother_profile_photo_api_service.g.dart';

@RestApi()
abstract class MotherProfilePhotoApiService {
  factory MotherProfilePhotoApiService(
      Dio dio, {
        String baseUrl,
      }) = _MotherProfilePhotoApiService;

  /// Upload profile image
  @MultiPart()
  @POST('/profile/upload-image')
  Future<UploadProfileImageResponse>
  uploadProfileImage(
      @Part(name: 'image') MultipartFile image,
      );

  /// Delete profile image
  @DELETE('/api/profile/image')
  Future<void> deleteProfileImage();

  /// Get profile image url only
  @GET('/api/profile/image')
  Future<HttpResponse<dynamic>> getProfileImage();
}