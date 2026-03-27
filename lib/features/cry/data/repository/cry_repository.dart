import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/features/cry/data/api/cry_api_service.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';


class CryRepository {
  final CryApiService _apiService;

  CryRepository(this._apiService);

  ///  يبعت الملف للـ API ويرجع النتيجة
  Future<CryAnalysisResult> analyzeCry({
    required String filePath,
    required String childId,
  }) async {
    try {
      final file = await MultipartFile.fromFile(
        filePath,
        filename: 'cry_recording.m4a',
      );

      final response = await _apiService.analyzeCry(file, childId);

      return CryAnalysisResult.fromDynamic(response);
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    } catch (e) {
      throw Exception("Failed to analyze cry: ${e.toString()}");
    }
  }
}