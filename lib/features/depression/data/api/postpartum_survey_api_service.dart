import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/postpartum_survey_request.dart';
import '../models/postpartum_survey_response.dart';

part 'postpartum_survey_api_service.g.dart';

@RestApi(baseUrl: "")
abstract class PostpartumSurveyApiService {
  factory PostpartumSurveyApiService(Dio dio, {String baseUrl}) =
      _PostpartumSurveyApiService;

  @POST("postpartumsurveys/submit")
  Future<PostpartumSurveyResponse> submitSurvey(
    @Body() PostpartumSurveyRequest request,
  );
}