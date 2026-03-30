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