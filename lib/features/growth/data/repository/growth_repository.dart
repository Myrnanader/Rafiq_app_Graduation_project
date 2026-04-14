import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';

import '../api/growth_api_service.dart';
import '../models/growth_record_request.dart';
import '../models/growth_record_response.dart';

class GrowthRepository {
  final GrowthApiService _apiService;

  GrowthRepository(this._apiService);

  // ─── ADD Growth Record ────────────────────────────────────

  Future<void> createGrowthRecord(GrowthRecordRequest request) async {
    try {
      final response = await _apiService.createGrowthRecord(request.toJson());

      ///  شيك على الـ response
      if (response is Map) {
        final status = response['status']?.toString();
        if (status != null && status != 'Success') {
          final message = response['message']?.toString();
          throw ErrorModel(message: message ?? 'Failed to add record');
        }
      }
    } on ErrorModel {
      rethrow;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    } catch (e) {
      if (e is ErrorModel) rethrow;
      throw ErrorModel(message: 'Failed to add growth record');
    }
  }

  // ─── GET Growth Records ───────────────────────────────────

  Future<GrowthDashboardResponse> getGrowthRecords(String childId) async {
    try {
      final response = await _apiService.getGrowthRecords(childId);

      ///  نـ parse الـ nested response يدوياً
      if (response is Map<String, dynamic>) {
        return GrowthDashboardResponse.fromJson(response);
      }

      ///  fallback لو الـ response مش Map
      return GrowthDashboardResponse(
        status: 'Success',
        records: [],
        latestRecord: null,
      );
    } on ErrorModel {
      rethrow;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    } catch (e) {
      if (e is ErrorModel) rethrow;
      throw ErrorModel(message: 'Failed to load growth records');
    }
  }
}