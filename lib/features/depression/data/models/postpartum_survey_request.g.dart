// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postpartum_survey_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostpartumSurveyRequest _$PostpartumSurveyRequestFromJson(
  Map<String, dynamic> json,
) => PostpartumSurveyRequest(
  answers: (json['answers'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$PostpartumSurveyRequestToJson(
  PostpartumSurveyRequest instance,
) => <String, dynamic>{'answers': instance.answers};
