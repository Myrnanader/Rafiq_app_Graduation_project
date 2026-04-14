import 'package:json_annotation/json_annotation.dart';

part 'postpartum_survey_request.g.dart';

@JsonSerializable()
class PostpartumSurveyRequest {
  final List<int> answers;

  PostpartumSurveyRequest({required this.answers});

  factory PostpartumSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$PostpartumSurveyRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PostpartumSurveyRequestToJson(this);
}