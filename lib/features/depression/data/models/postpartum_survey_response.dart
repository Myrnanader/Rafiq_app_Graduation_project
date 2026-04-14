import 'package:json_annotation/json_annotation.dart';

part 'postpartum_survey_response.g.dart';

@JsonSerializable()
class PostpartumSurveyResponse {
  final String status;

  @JsonKey(defaultValue: 0)
  final int totalScore;

  @JsonKey(defaultValue: "")
  final String riskLevel;

  @JsonKey(defaultValue: "")
  final String message;

  PostpartumSurveyResponse({
    required this.status,
    required this.totalScore,
    required this.riskLevel,
    required this.message,
  });

  factory PostpartumSurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$PostpartumSurveyResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PostpartumSurveyResponseToJson(this);
}