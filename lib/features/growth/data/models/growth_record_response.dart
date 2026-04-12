import 'package:json_annotation/json_annotation.dart';

part 'growth_record_response.g.dart';

@JsonSerializable()
class GrowthRecordResponse {
  final String id;
  final String childId;
  final double weightKg;
  final double heightCm;
  final DateTime measurementDate;

  GrowthRecordResponse({
    required this.id,
    required this.childId,
    required this.weightKg,
    required this.heightCm,
    required this.measurementDate,
  });

  factory GrowthRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$GrowthRecordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRecordResponseToJson(this);
}