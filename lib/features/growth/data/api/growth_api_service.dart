import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'growth_api_service.g.dart';

@RestApi(baseUrl: "https://rafiq.runasp.net/api/")
abstract class GrowthApiService {
  factory GrowthApiService(Dio dio, {String baseUrl}) = _GrowthApiService;

  ///  POST - body كـ Map عشان الـ JSON يتبعت صح
  @POST("GrowthRecords")
  Future<dynamic> createGrowthRecord(
    @Body() Map<String, dynamic> body,
  );

  ///  GET - dynamic عشان نـ parse الـ nested response يدوياً
  /// الـ API بيرجع: { "status": "...", "data": { "records": [...], "latestRecord": {...} } }
  @GET("GrowthRecords/child/{childId}")
  Future<dynamic> getGrowthRecords(
    @Path("childId") String childId,
  );
}