import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/basic_response.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../models/verify_otp_request.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// LOGIN
  @POST("Auth/login")
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> body,
  );

  /// REGISTER
  @POST("Auth/register")
  Future<RegisterResponse> register(
    @Body() RegisterRequest body,
  );

  /// VERIFY REGISTRATION
  @POST("Auth/verify-registration")
  Future<LoginResponse> verifyRegistration(
    @Body() Map<String, dynamic> body,
  );

  /// VERIFY OTP
  @POST("Auth/verify-otp")
  Future<BasicResponse> verifyOtp(
    @Body() VerifyOtpRequest body,
  );

  /// RESEND OTP
  @POST("Auth/resend-otp")
  Future<BasicResponse> resendOtp(
    @Body() Map<String, dynamic> body,
  );

  /// FORGET PASSWORD
  @POST("Auth/forget-password")
  Future<BasicResponse> forgetPassword(
    @Body() Map<String, dynamic> body,
  );

  /// RESET PASSWORD
  @POST("Auth/reset-password")
  Future<BasicResponse> resetPassword(
    @Body() Map<String, dynamic> body,
  );

  /// LOGOUT (هيحتاج token)
  @POST("Auth/logout")
  Future<void> logout();
}