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
    /// ✅ Validate الـ request قبل ما نبعته للـ API
    request.validate();

    try {
      final response = await api.editProfile(request.toJson());

      /// ✅ شيك على الـ response لو الـ backend بعت isSuccess false مع 200
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

      /// ✅ شيك على الـ response
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
}