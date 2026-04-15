part of 'auth_cubit.dart';

abstract class AuthState {}

/// INITIAL
class AuthInitial extends AuthState {}

/// LOADING (عام لكل العمليات)
class AuthLoading extends AuthState {}

/// LOGIN SUCCESS
class LoginSuccess extends AuthState {}

///Change Password Success
class ChangePasswordSuccess extends AuthState {}

/// REGISTER → محتاج OTP
class RegisterNeedsVerification extends AuthState {
  final String email;
  RegisterNeedsVerification(this.email);
}

/// OTP VERIFIED (سواء register أو reset)
class OtpVerified extends AuthState {
  final String email;
  OtpVerified(this.email);
}

///  RESEND OTP STATES
class ResendOtpLoading extends AuthState {}

class ResendOtpSuccess extends AuthState {}

class ResendOtpError extends AuthState {
  final String message;
  ResendOtpError(this.message);
}

/// ERROR عام
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
