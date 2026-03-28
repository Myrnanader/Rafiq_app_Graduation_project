import '../api/mother_settings_api_service.dart';
import '../models/edit_profile_request.dart';

class MotherSettingsRepository {
  final MotherSettingsApiService api;

  MotherSettingsRepository(this.api);

  Future<void> editProfile(EditProfileRequest request) async {
    try {
      await api.editProfile(request.toJson());
    } catch (e) {
      throw Exception('Edit profile failed');
    }
  }

  Future<void> deleteAccount() async {
    try {
      await api.deleteAccount();
    } catch (e) {
      throw Exception('Delete account failed');
    }
  }
}