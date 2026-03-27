import 'package:dio/dio.dart';
import 'package:rafiq_app/features/auth/data/models/profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: "http://rafiq.runasp.net/api/")
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @GET("profile/me")
  Future<ProfileResponse> getProfile();
}