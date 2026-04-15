import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import 'package:rafiq_app/core/storage/secure_storage_service.dart';
import 'package:rafiq_app/core/storage/shared_prefs_service.dart';

import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final SecureStorageService secureStorage;

  AuthCubit(this.repository, this.secureStorage) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      final response = await repository.login(
        LoginRequest(email: email, password: password),
      );

      await secureStorage.saveTokens(
        accessToken: response.token!,
        refreshToken: response.refreshToken!,
      );
      await secureStorage.saveEmail(email);
      await SharedPrefsService.setLoggedIn(true);

      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> register(RegisterRequest request) async {
    emit(AuthLoading());

    try {
      await repository.register(request);
      emit(RegisterNeedsVerification(request.email));
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> verifyRegistration({
    required String email,
    required String otp,
    required String fullName,
    required int? pregnancyWeek,
  }) async {
    emit(AuthLoading());

    try {
      final response = await repository.verifyRegistration(
        email: email,
        otp: otp,
      );

      await secureStorage.saveTokens(
        accessToken: response.token!,
        refreshToken: response.refreshToken!,
      );
      await secureStorage.saveEmail(email);
      await SharedPrefsService.saveUserData(
        fullName: fullName,
        pregnancyWeek: pregnancyWeek,
      );

      await SharedPrefsService.setLoggedIn(true);

      emit(OtpVerified(email));
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> resendOtp({
    required String email,
    required String purpose,
  }) async {
    emit(ResendOtpLoading());

    try {
      await repository.resendOtp(email: email, purpose: purpose);
      emit(ResendOtpSuccess());
    } catch (e) {
      emit(ResendOtpError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());

    try {
      await repository.forgetPassword(email);
      emit(RegisterNeedsVerification(email));
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(AuthLoading());

    try {
      await repository.verifyOtp(email: email, otp: otp);
      emit(OtpVerified(email));
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(AuthLoading());

    try {
      await repository.resetPassword(email: email, newPassword: newPassword);

      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e is ErrorModel ? e.message : "Unexpected error"));
    }
  }

Future<void> changePassword({
  required String currentPassword,
  required String newPassword,
  required String confirmPassword,
}) async {
  emit(AuthLoading());

  try {
    await repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    emit(ChangePasswordSuccess());   
  } on ErrorModel catch (e) {
    emit(AuthError(e.message));
  } catch (e) {
    emit(AuthError("Failed to change password"));
  }
}

  Future<void> logout() async {
    emit(AuthLoading());

    try {
      await repository.logout();
    } catch (_) {}

    await secureStorage.clearAll();
    await SharedPrefsService.setLoggedIn(false);

    emit(AuthInitial());
  }
}
