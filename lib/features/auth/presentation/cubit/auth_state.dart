part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

/// ✅ Login success
class AuthSuccess extends AuthState {}

/// 🔥 Register محتاج OTP
class RegisterNeedsVerification extends AuthState {
  final String email;

  RegisterNeedsVerification(this.email);
}

/// 🔥 OTP Verified (سواء register أو forget)
class OtpVerified extends AuthState {
  final String email;

  OtpVerified(this.email);
}

/// 🔥 Error
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}