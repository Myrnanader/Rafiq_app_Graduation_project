import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';

part 'children_api_service.g.dart';

@RestApi(baseUrl: "https://rafiq.runasp.net/api/")
abstract class ChildrenApiService {
  factory ChildrenApiService(Dio dio, {String baseUrl}) =
      _ChildrenApiService;

  @GET("MotherProfile/children")
  Future<ChildrenResponseWrapper> getChildren();
}