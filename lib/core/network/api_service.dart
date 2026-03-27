import 'package:dio/dio.dart';
import 'package:rafiq_app/features/auth/data/models/register_request.dart';
import 'package:rafiq_app/features/auth/data/models/register_response.dart';
import 'package:rafiq_app/features/auth/data/models/verify_otp_request.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://rafiq.runasp.net/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// ================= AUTH =================

  @POST("Auth/login")
  Future<dynamic> login(
    @Body() Map<String, dynamic> body,
  );

  @POST("Auth/register")
  Future<RegisterResponse> register(
    @Body() RegisterRequest body,
  );

  @POST("Auth/refresh-token")
  Future<dynamic> refreshToken(
    @Body() Map<String, dynamic> body,
  );

  @POST("Auth/change-password")
  Future<dynamic> changePassword(
    @Body() Map<String, dynamic> body,
  );

  @POST("Auth/forget-password")
  Future<dynamic> forgetPassword(
    @Body() Map<String, dynamic> body,
  );

  @POST("Auth/verify-otp")
  Future<dynamic> verifyOtp(
    @Body() VerifyOtpRequest body,
  );

  @POST("Auth/verify-registration")
  Future<dynamic> verifyRegistration(
    @Body() Map<String, dynamic> body,
  );

  @POST("Auth/reset-password")
  Future<dynamic> resetPassword(
    @Body() Map<String, dynamic> body,
  );

  ///  NEW: موجود في الـ Swagger - لازم يتضاف
  @POST("Auth/logout")
  Future<dynamic> logout();

  @POST("Auth/make-admin")
  Future<dynamic> makeAdmin(
    @Body() Map<String, dynamic> body,
  );
}