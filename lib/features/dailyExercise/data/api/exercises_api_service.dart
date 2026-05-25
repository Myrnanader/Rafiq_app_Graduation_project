import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/exercise_model.dart';
import '../models/basic_response.dart';
import '../models/exercise_response.dart';

part 'exercises_api_service.g.dart';

@RestApi()
abstract class ExercisesApiService {
  factory ExercisesApiService(Dio dio, {String baseUrl}) = _ExercisesApiService;

  /// GET EXERCISES BY TRIMESTER
  @GET("exercises")
  Future<ExerciseResponse<List<ExerciseModel>>> getExercisesByTrimester(
    @Query("trimester") int trimester,
  );

  /// GET BY ID
  @GET("exercises/{id}")
  Future<ExerciseResponse<ExerciseModel>> getExerciseById(
    @Path("id") String id,
  );

  /// DELETE
  @DELETE("exercises/{id}")
  Future<BasicResponse> deleteExercise(@Path("id") String id);

  /// CREATE (ADMIN - MULTIPART)
  @MultiPart()
  @POST("exercises")
  Future<ExerciseResponse<ExerciseModel>> createExercise({
    @Part(name: "Title") required String title,
    @Part(name: "ShortSummary") required String shortSummary,
    @Part(name: "FullDescription") required String fullDescription,
    @Part(name: "TargetTrimester") required int targetTrimester,
    @Part(name: "Image") MultipartFile? image,
  });
}
