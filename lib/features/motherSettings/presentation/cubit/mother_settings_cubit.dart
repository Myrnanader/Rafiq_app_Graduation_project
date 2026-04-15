import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/edit_profile_request.dart';
import '../../data/repository/mother_settings_repository.dart';

part 'mother_settings_state.dart';

class MotherSettingsCubit extends Cubit<MotherSettingsState> {
  final MotherSettingsRepository repository;

  MotherSettingsCubit(this.repository) : super(MotherSettingsInitial());

  // ─── EDIT PROFILE ─────────────────────────────────────────

  Future<void> editProfile(EditProfileRequest request) async {
    emit(EditProfileLoading());
    try {
      await repository.editProfile(request);
      emit(EditProfileSuccess());
    } on ErrorModel catch (e) {
      emit(EditProfileError(e.message));
    } catch (e) {
      emit(EditProfileError('Failed to update profile. Please try again.'));
    }
  }

  // ─── DELETE ACCOUNT ───────────────────────────────────────

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    try {
      await repository.deleteAccount();
      emit(DeleteAccountSuccess());
    } on ErrorModel catch (e) {
      emit(DeleteAccountError(e.message));
    } catch (e) {
      emit(DeleteAccountError('Failed to delete account. Please try again.'));
    }
  }

  // ─── MAKE ADMIN  ───────────────────────────────────────

  Future<void> makeAdmin(String email) async {
    emit(MakeAdminLoading());

    try {
      await repository.makeAdmin(email);
      emit(MakeAdminSuccess());
    } on ErrorModel catch (e) {
      emit(MakeAdminError(e.message));
    } catch (e) {
      emit(MakeAdminError('Failed to promote user'));
    }
  }
}