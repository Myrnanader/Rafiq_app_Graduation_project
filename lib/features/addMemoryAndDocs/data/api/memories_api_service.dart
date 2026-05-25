import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/memory_model.dart';
import '../models/basic_response.dart';
import '../models/memory_response.dart';

part 'memories_api_service.g.dart';

@RestApi()
abstract class MemoriesApiService {
  factory MemoriesApiService(Dio dio, {String baseUrl}) =
  _MemoriesApiService;

  @GET("memories")
  Future<MemoriesResponse> getMemories();

  @GET("memories/{id}")
  Future<MemoryModel> getMemoryById(@Path("id") String id);

  @DELETE("memories/{id}")
  Future<BasicResponse> deleteMemory(@Path("id") String id);

  @MultiPart()
  @POST("memories")
  Future<BasicResponse> uploadMemory({
    @Part(name: "Title") required String title,
    @Part(name: "Description") String? description,
    @Part(name: "Date") String? date,
    @Part(name: "Image") MultipartFile? image,
  });
}
