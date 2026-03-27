import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';

import '../api/auth_api_service.dart';
import '../models/basic_response.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../models/verify_otp_request.dart';

class AuthRepository {
  final AuthApiService api;

  AuthRepository(this.api);

  /// LOGIN
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await api.login(request.toJson());

      if (!response.isSuccess) {
        throw ErrorModel(message: response.message);
      }

      return response;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// REGISTER
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await api.register(request);

      if (!response.isSuccess) {
        throw ErrorModel(message: response.message);
      }

      return response;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// VERIFY REGISTRATION
  Future<LoginResponse> verifyRegistration({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await api.verifyRegistration({
        "email": email,
        "otpCode": otp,
      });

      if (!response.isSuccess) {
        throw ErrorModel(message: response.message);
      }

      return response;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// RESEND OTP
  Future<void> resendOtp({
    required String email,
    required String purpose,
  }) async {
    try {
      final response = await api.resendOtp({
        "identifier": email,
        "purpose": purpose,
      });

      if (response.status == "Error") {
        throw ErrorModel(message: response.message ?? "Error");
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// FORGET PASSWORD
  Future<void> forgetPassword(String email) async {
    try {
      final response = await api.forgetPassword({
        "email": email,
      });

      if (response.status == "Error") {
        throw ErrorModel(message: response.message ?? "Error");
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// VERIFY OTP
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await api.verifyOtp(
        VerifyOtpRequest(email: email, otpCode: otp),
      );

      if (response.status == "Error") {
        throw ErrorModel(message: response.message ?? "Invalid OTP");
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// RESET PASSWORD
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await api.resetPassword({
        "email": email,
        "newPassword": newPassword,
        "confirmPassword": newPassword,
      });

      if (response.status == "Error") {
        throw ErrorModel(message: response.message ?? "Error");
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    try {
      await api.logout();
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }
}