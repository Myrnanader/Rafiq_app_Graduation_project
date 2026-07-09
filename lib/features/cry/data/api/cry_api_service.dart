import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';

part 'cry_api_service.g.dart';

@RestApi(
  baseUrl: "https://rafiq-production-a90b7.up.railway.app/",
)
abstract class CryApiService {
  factory CryApiService(
      Dio dio, {
        String baseUrl,
      }) = _CryApiService;

  @POST("analyze-cry")
  @MultiPart()
  Future<CryAnalysisResult> analyzeCry(
      @Part(name: "file") MultipartFile file,
      @Part(name: "childId") String childId,
      );
}