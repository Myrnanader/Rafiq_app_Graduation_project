import 'package:json_annotation/json_annotation.dart';

part 'cry_model.g.dart';

/// النتيجة اللي بترجع من الـ API بعد تحليل الصوت
@JsonSerializable()
class CryAnalysisResult {
  /// مثال: "Angry"
  final String? primaryEmotion;

  /// مثال: 81.3
  final double? primaryConfidence;

  /// مثال: "Sleepy"
  final String? secondaryEmotion;

  /// مثال: 18.7
  final double? secondaryConfidence;

  /// الـ message من الـ API
  final String? message;

  /// هل نجح؟
  final bool? isSuccess;

  const CryAnalysisResult({
    this.primaryEmotion,
    this.primaryConfidence,
    this.secondaryEmotion,
    this.secondaryConfidence,
    this.message,
    this.isSuccess,
  });

  factory CryAnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$CryAnalysisResultFromJson(json);

  Map<String, dynamic> toJson() => _$CryAnalysisResultToJson(this);

  /// Fallback لو الـ API structure مختلف
  factory CryAnalysisResult.fromDynamic(dynamic data) {
    if (data is Map<String, dynamic>) {
      return CryAnalysisResult.fromJson(data);
    }
    return const CryAnalysisResult(
      primaryEmotion: "Unknown",
      primaryConfidence: 0,
      message: "Could not parse result",
      isSuccess: false,
    );
  }
}