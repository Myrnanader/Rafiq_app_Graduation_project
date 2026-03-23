import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import 'package:rafiq_app/core/network/api_service.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../models/verify_otp_request.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  /// ===========================
  /// 🔵 LOGIN
  /// ===========================
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await apiService.login(request.toJson());
      final loginResponse = LoginResponse.fromJson(response);

      /// ✅ FIX: السيرفر بيرجع 200 حتى لو فشل - لازم نشيك على isSuccess
      if (!loginResponse.isSuccess) {
        throw ErrorModel(message: loginResponse.message);
      }

      return loginResponse;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 🔴 REGISTER
  /// ===========================
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await apiService.register(request);

      /// ✅ FIX: شيك على isSuccess
      if (!response.isSuccess) {
        throw ErrorModel(message: response.message);
      }

      return response;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 🔥 VERIFY REGISTRATION
  /// ===========================
  Future<dynamic> verifyRegistration({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiService.verifyRegistration({
        "email": email,
        "otpCode": otp,
      });

      /// ✅ FIX: بعض الـ responses بتيجي مع isSuccess false
      if (response is Map && response["isSuccess"] == false) {
        throw ErrorModel(message: response["message"] ?? "Verification failed");
      }

      return response;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 📧 FORGET PASSWORD
  /// ===========================
  Future<void> forgetPassword(String email) async {
    try {
      final response = await apiService.forgetPassword({
        "email": email,
      });

      /// ✅ FIX: السيرفر بيرجع {"status": "Error", "message": "..."} لما يفشل
      if (response is Map) {
        final isSuccess = response["isSuccess"];
        final status = response["status"];
        final message = response["message"];

        if (isSuccess == false || status == "Error") {
          throw ErrorModel(message: message ?? "Could not process request");
        }
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 🔢 VERIFY OTP (RESET PASSWORD)
  /// ===========================
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiService.verifyOtp(
        VerifyOtpRequest(
          email: email,
          otpCode: otp,
        ),
      );

      /// ✅ FIX: شيك على الـ response
      if (response is Map) {
        final status = response["status"];
        final message = response["message"];
        if (status == "Error") {
          throw ErrorModel(message: message ?? "Invalid OTP");
        }
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 🔑 RESET PASSWORD
  /// ===========================
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await apiService.resetPassword({
        "email": email,
        "newPassword": newPassword,
        "confirmPassword": newPassword, // ✅ متوافق مع الـ Swagger
      });

      if (response is Map) {
        final status = response["status"];
        final message = response["message"];
        if (status == "Error") {
          throw ErrorModel(message: message ?? "Could not reset password");
        }
      }
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ===========================
  /// 🚪 LOGOUT
  /// ===========================
  /// ✅ NEW: موجود في الـ Swagger بس مكانش موجود في الـ Repository
  Future<void> logout() async {
    try {
      await apiService.logout();
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }
}