// mother_profile_api_service.dart

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/add_baby_request.dart';
import '../models/link_father_request.dart';

part 'mother_profile_api_service.g.dart';

@RestApi()
abstract class MotherProfileApiService {
  factory MotherProfileApiService(Dio dio) =
      _MotherProfileApiService;

  @GET('MotherProfile/children')
  Future<dynamic> getChildren();

  @POST('MotherProfile/baby')
  Future<void> addBaby(
    @Body() AddBabyRequest request,
  );

  @POST('MotherProfile/link-father')
  Future<void> linkFather(
    @Body() LinkFatherRequest request,
  );
}