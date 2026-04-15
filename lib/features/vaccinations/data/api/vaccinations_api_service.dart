import 'package:dio/dio.dart';
import 'package:rafiq_app/features/vaccinations/data/models/vaccination_single_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/vaccination_response.dart';

part 'vaccinations_api_service.g.dart';

@RestApi()
abstract class VaccinationsApiService {
  factory VaccinationsApiService(Dio dio, {String baseUrl}) =
      _VaccinationsApiService;

  ///  Get all vaccines for child
  @GET("vaccinations/child/{childId}")
  Future<VaccinationResponse> getVaccines(
    @Path("childId") String childId,
  );

  ///  Get single vaccine
  @GET("vaccinations/{id}")
  Future<VaccinationSingleResponse> getVaccineById(
    @Path("id") String id,
  );

  ///  Create vaccine (Admin)
  @POST("vaccinations/CreateVaccine")
  Future<VaccinationSingleResponse> createVaccine(
    @Body() Map<String, dynamic> body,
  );

  ///  Schedule vaccine
  @PATCH("vaccinations/{id}/schedule")
  Future<VaccinationSingleResponse> scheduleVaccine(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  ///  Mark taken (FIXED )
  @PATCH("vaccinations/{id}/mark-taken")
  Future<VaccinationSingleResponse> markTaken(
    @Path("id") String id,
    @Query("takenDate") String? takenDate,
  );

  ///  Delete vaccine
  @DELETE("vaccinations/{id}")
  Future<void> deleteVaccine(
    @Path("id") String id,
  );
}