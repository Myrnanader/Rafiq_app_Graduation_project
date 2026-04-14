import '../api/postpartum_survey_api_service.dart';
import '../models/postpartum_survey_request.dart';
import '../models/postpartum_survey_response.dart';

class PostpartumSurveyRepository {
  final PostpartumSurveyApiService api;

  PostpartumSurveyRepository(this.api);

  Future<PostpartumSurveyResponse> submitSurvey(
      List<int> answers) async {
    return await api.submitSurvey(
      PostpartumSurveyRequest(answers: answers),
    );
  }
}