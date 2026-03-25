part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class RegisterNeedsVerification extends AuthState {
  final String email;
  RegisterNeedsVerification(this.email);
}

class OtpVerified extends AuthState {
  final String email;
  OtpVerified(this.email);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}