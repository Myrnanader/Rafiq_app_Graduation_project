import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';

import '../api/mother_settings_api_service.dart';
import '../models/edit_profile_request.dart';
import '../../../auth/data/models/basic_response.dart';

class MotherSettingsRepository {
  final MotherSettingsApiService api;

  MotherSettingsRepository(this.api);

  // ─── EDIT PROFILE ─────────────────────────────────────────

  Future<void> editProfile(EditProfileRequest request) async {
    request.validate();

    try {
      final BasicResponse response =
          await api.editProfile(request.toJson());

      if (response.status != "Success") {
        throw ErrorModel(
          message: response.message ?? 'Failed to update profile',
        );
      }
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }

  // ─── DELETE ACCOUNT ───────────────────────────────────────

 Future<void> deleteAccount() async {
  try {
    final response = await api.deleteAccount({}); 

    if (response.status != "Success") {
      throw ErrorModel(
        message: response.message ?? 'Failed to delete account',
      );
    }
  } on DioException catch (e) {
    throw ApiErrorHandler.handle(e);
  } catch (e) {
    throw ErrorModel(message: 'Failed to delete account');
  }
}

  // ─── MAKE ADMIN ─────────────────────────────────────────

  Future<void> makeAdmin(String email) async {
    try {
      final BasicResponse response =
          await api.makeAdmin({"email": email});

      if (response.status != "Success") {
        throw ErrorModel(
          message: response.message ?? 'Failed to make admin',
        );
      }
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      throw ErrorModel(message: 'Failed to make admin');
    }
  }
}