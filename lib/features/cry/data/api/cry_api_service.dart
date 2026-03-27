import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cry_api_service.g.dart';

@RestApi(baseUrl: "http://rafiq.runasp.net/api/")
abstract class CryApiService {
  factory CryApiService(Dio dio, {String baseUrl}) = _CryApiService;

  /// ✅ multipart/form-data upload
  /// POST /api/CryRecordings/analyze
  @POST("CryRecordings/analyze")
  @MultiPart()
  Future<dynamic> analyzeCry(
    @Part(name: "file") MultipartFile file,
    @Part(name: "childId") String childId,
  );
}