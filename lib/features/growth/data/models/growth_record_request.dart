import 'package:json_annotation/json_annotation.dart';

part 'growth_record_request.g.dart';

@JsonSerializable()
class GrowthRecordRequest {
  final String childId;
  final double weightKg;
  final double heightCm;

  ///  نبعته String مش DateTime
  /// الـ .NET بيستنى "2026-04-10" مش DateTime object
  @JsonKey(name: 'measurementDate')
  final String measurementDate;

  GrowthRecordRequest({
    required this.childId,
    required this.weightKg,
    required this.heightCm,
    required this.measurementDate,
  });

  ///  Helper constructor من DateTime
  factory GrowthRecordRequest.fromDateTime({
    required String childId,
    required double weightKg,
    required double heightCm,
    required DateTime date,
  }) {
    return GrowthRecordRequest(
      childId: childId,
      weightKg: weightKg,
      heightCm: heightCm,
      /// بنبعت date فقط بدون time: "2026-04-10"
      measurementDate:
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    );
  }

  factory GrowthRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$GrowthRecordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRecordRequestToJson(this);
}