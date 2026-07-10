import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/features/cry/data/api/cry_api_service.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';

class CryRepository {
  final CryApiService _apiService;

  CryRepository(this._apiService);

  Future<CryAnalysisResult> analyzeCry({
    required String filePath,
  }) async {
    try {
      final file = await MultipartFile.fromFile(
        filePath,
        filename: 'cry_recording.wav',
      );

      return await _apiService.analyzeCry(file);
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    } catch (e) {
      throw Exception(
        "Failed to analyze cry: ${e.toString()}",
      );
    }
  }
}