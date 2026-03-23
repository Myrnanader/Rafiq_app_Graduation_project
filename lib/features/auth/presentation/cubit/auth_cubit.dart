import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import 'package:rafiq_app/core/storage/secure_storage_service.dart';

import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final SecureStorageService secureStorage;

  AuthCubit(this.repository, this.secureStorage)
      : super(AuthInitial());

  /// ===========================
  /// 🔐 LOGIN
  /// ===========================
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final response = await repository.login(
        LoginRequest(email: email, password: password),
      );

      /// 🔥 نتأكد إن التوكن موجود قبل ما نخزنه
      if (response.token != null &&
          response.refreshToken != null &&
          response.token!.isNotEmpty &&
          response.refreshToken!.isNotEmpty) {
        await secureStorage.saveTokens(
          accessToken: response.token!,
          refreshToken: response.refreshToken!,
        );
      } else {
        /// ⚠️ لو السيرفر رجع success بدون token
        throw ErrorModel(message: "Invalid login response (no token)");
      }

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 📝 REGISTER
  /// ===========================
  Future<void> register(RegisterRequest request) async {
    emit(AuthLoading());

    try {
      await repository.register(request);

      /// ❗ مفيش token هنا
      emit(RegisterNeedsVerification(request.email));
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 🔢 VERIFY REGISTRATION OTP
  /// ===========================
  Future<void> verifyRegistration({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());

    try {
      final response = await repository.verifyRegistration(
        email: email,
        otp: otp,
      );

      /// 🔥 التعامل مع response dynamic
      if (response is Map) {
        final token = response["token"];
        final refreshToken = response["refreshToken"];

        if (token != null &&
            refreshToken != null &&
            token.toString().isNotEmpty &&
            refreshToken.toString().isNotEmpty) {
          await secureStorage.saveTokens(
            accessToken: token.toString(),
            refreshToken: refreshToken.toString(),
          );
        }
      }

      emit(OtpVerified(email));
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 📧 FORGET PASSWORD
  /// ===========================
  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());

    try {
      await repository.forgetPassword(email);

      /// 🔥 reuse نفس state
      emit(RegisterNeedsVerification(email));
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 🔢 VERIFY OTP (RESET PASSWORD)
  /// ===========================
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());

    try {
      await repository.verifyOtp(email: email, otp: otp);

      emit(OtpVerified(email));
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 🔑 RESET PASSWORD
  /// ===========================
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(AuthLoading());

    try {
      await repository.resetPassword(
        email: email,
        newPassword: newPassword,
      );

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Unexpected error occurred",
      ));
    }
  }

  /// ===========================
  /// 🚪 LOGOUT
  /// ===========================
  Future<void> logout() async {
    try {
      await repository.logout();
      await secureStorage.clearTokens();

      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(
        e is ErrorModel ? e.message : "Logout failed",
      ));
    }
  }
}