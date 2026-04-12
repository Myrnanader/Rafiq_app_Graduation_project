import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/growth_record_request.dart';
import '../models/growth_record_response.dart';

part 'growth_api_service.g.dart';

@RestApi()
abstract class GrowthApiService {
  factory GrowthApiService(Dio dio, {String baseUrl}) = _GrowthApiService;

  /// ================= CREATE =================
  @POST("GrowthRecords")
  Future<void> createGrowthRecord(
    @Body() GrowthRecordRequest request,
  );

  /// ================= GET =================
  @GET("GrowthRecords/child/{childId}")
  Future<List<GrowthRecordResponse>> getGrowthRecords(
    @Path("childId") String childId,
  );
}