abstract class PostpartumSurveyState {}

class SurveyInitial extends PostpartumSurveyState {}

class SurveyLoading extends PostpartumSurveyState {}

class SurveySuccess extends PostpartumSurveyState {
  final int totalScore;
  final String riskLevel;

  SurveySuccess(this.totalScore, this.riskLevel);
}

class SurveyError extends PostpartumSurveyState {
  final String message;

  SurveyError(this.message);
}