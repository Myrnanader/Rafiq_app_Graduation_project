part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final ProfileResponse profile;

  UserLoaded(this.profile);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}