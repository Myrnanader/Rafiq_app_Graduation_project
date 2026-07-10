// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryAnalysisResult _$CryAnalysisResultFromJson(Map<String, dynamic> json) =>
    CryAnalysisResult(
      cryDetected: json['cry_detected'] as bool,
      probabilitiesPerSecond:
          (json['probabilities_per_second'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      analysisProbs:
          (json['analysis_probs'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      cryType: json['cry_type'] as String?,
    );

Map<String, dynamic> _$CryAnalysisResultToJson(CryAnalysisResult instance) =>
    <String, dynamic>{
      'cry_detected': instance.cryDetected,
      'probabilities_per_second': instance.probabilitiesPerSecond,
      'cry_type': instance.cryType,
      'analysis_probs': instance.analysisProbs,
    };
