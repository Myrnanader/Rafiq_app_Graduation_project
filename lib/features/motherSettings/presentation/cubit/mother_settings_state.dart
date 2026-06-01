part of 'mother_settings_cubit.dart';

abstract class MotherSettingsState {}

class MotherSettingsInitial extends MotherSettingsState {}

class EditProfileLoading extends MotherSettingsState {}

class EditProfileSuccess extends MotherSettingsState {}

class EditProfileError extends MotherSettingsState {
  final String message;
  EditProfileError(this.message);
}

class DeleteAccountLoading extends MotherSettingsState {}

class DeleteAccountSuccess extends MotherSettingsState {}

class DeleteAccountError extends MotherSettingsState {
  final String message;
  DeleteAccountError(this.message);
}

///  MAKE ADMIN STATES

class MakeAdminLoading extends MotherSettingsState {}

class MakeAdminSuccess extends MotherSettingsState {
  final String message;

  MakeAdminSuccess(this.message);
}

class MakeAdminError extends MotherSettingsState {
  final String message;
  MakeAdminError(this.message);
}