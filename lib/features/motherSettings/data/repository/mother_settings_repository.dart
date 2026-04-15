import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import '../api/mother_settings_api_service.dart';
import '../models/edit_profile_request.dart';

class MotherSettingsRepository {
  final MotherSettingsApiService api;

  MotherSettingsRepository(this.api);

  // ─── EDIT PROFILE ─────────────────────────────────────────

  Future<void> editProfile(EditProfileRequest request) async {
    request.validate();

    try {
      final response = await api.editProfile(request.toJson());

      if (response is Map) {
        final isSuccess = response['isSuccess'];
        final message = response['message']?.toString();
        if (isSuccess == false) {
          throw ErrorModel(message: message ?? 'Failed to update profile');
        }
      }
    } on ErrorModel {
      rethrow;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      if (e is ErrorModel) rethrow;
      throw ErrorModel(message: 'Failed to update profile');
    }
  }

  // ─── DELETE ACCOUNT ───────────────────────────────────────

  Future<void> deleteAccount() async {
    try {
      final response = await api.deleteAccount();

      if (response is Map) {
        final isSuccess = response['isSuccess'];
        final message = response['message']?.toString();
        if (isSuccess == false) {
          throw ErrorModel(message: message ?? 'Failed to delete account');
        }
      }
    } on ErrorModel {
      rethrow;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      if (e is ErrorModel) rethrow;
      throw ErrorModel(message: 'Failed to delete account');
    }
  }

  // ─── MAKE ADMIN  ───────────────────────────────────────

  Future<void> makeAdmin(String email) async {
    try {
      final response = await api.makeAdmin({
        "email": email,
      });

      if (response is Map) {
        final isSuccess = response['isSuccess'];
        final message = response['message']?.toString();

        if (isSuccess == false) {
          throw ErrorModel(message: message ?? 'Failed to make admin');
        }
      }
    } on ErrorModel {
      rethrow;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      throw ErrorModel(message: 'Failed to make admin');
    }
  }
}