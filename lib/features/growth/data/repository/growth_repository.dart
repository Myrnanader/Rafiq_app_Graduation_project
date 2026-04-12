import 'package:rafiq_app/core/errors/api_error_handler.dart';


import '../api/growth_api_service.dart';
import '../models/growth_record_request.dart';
import '../models/growth_record_response.dart';

class GrowthRepository {
  final GrowthApiService _apiService;

  GrowthRepository(this._apiService);

  /// ================= ADD =================
  Future<void> createGrowthRecord(
    GrowthRecordRequest request,
  ) async {
    try {
      await _apiService.createGrowthRecord(request);
    } catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }

  /// ================= GET =================
  Future<List<GrowthRecordResponse>> getGrowthRecords(
    String childId,
  ) async {
    try {
      final response = await _apiService.getGrowthRecords(childId);
      return response;
    } catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }
}