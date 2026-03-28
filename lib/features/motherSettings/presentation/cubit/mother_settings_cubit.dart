import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/edit_profile_request.dart';
import '../../data/repository/mother_settings_repository.dart';

part 'mother_settings_state.dart';

class MotherSettingsCubit extends Cubit<MotherSettingsState> {
  final MotherSettingsRepository repository;

  MotherSettingsCubit(this.repository)
      : super(MotherSettingsInitial());

  Future<void> editProfile(EditProfileRequest request) async {
    emit(EditProfileLoading());
    try {
      await repository.editProfile(request);
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    try {
      await repository.deleteAccount();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(DeleteAccountError(e.toString()));
    }
  }
}