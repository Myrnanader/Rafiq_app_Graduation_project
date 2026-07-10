import 'package:json_annotation/json_annotation.dart';

part 'cry_model.g.dart';

@JsonSerializable()
class CryAnalysisResult {
  @JsonKey(name: 'cry_detected')
  final bool cryDetected;

  @JsonKey(name: 'probabilities_per_second', defaultValue: <double>[])
  final List<double> probabilitiesPerSecond;

  @JsonKey(name: 'cry_type')
  final String? cryType;

  @JsonKey(name: 'analysis_probs', defaultValue: <double>[])
  final List<double> analysisProbs;

  const CryAnalysisResult({
    required this.cryDetected,
    required this.probabilitiesPerSecond,
    required this.analysisProbs,
    this.cryType,
  });

  factory CryAnalysisResult.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$CryAnalysisResultFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CryAnalysisResultToJson(this);

  factory CryAnalysisResult.fromDynamic(dynamic data) {
    if (data is Map<String, dynamic>) {
      return CryAnalysisResult.fromJson(data);
    }

    return const CryAnalysisResult(
      cryDetected: false,
      probabilitiesPerSecond: [],
      analysisProbs: [],
      cryType: null,
    );
  }
}