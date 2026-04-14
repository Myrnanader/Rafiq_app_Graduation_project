import 'package:json_annotation/json_annotation.dart';

part 'growth_record_response.g.dart';

@JsonSerializable()
class GrowthRecordResponse {
  final String id;
  final String childId;
  final double weightKg;
  final double heightCm;

  @JsonKey(fromJson: _parseDate)
  final DateTime measurementDate;

  GrowthRecordResponse({
    required this.id,
    required this.childId,
    required this.weightKg,
    required this.heightCm,
    required this.measurementDate,
  });

  static DateTime _parseDate(dynamic value) {
    if (value is String) {
      final parsed = DateTime.tryParse(value);
      if (parsed != null) return parsed;
    }
    throw Exception("Invalid date format");
  }

  factory GrowthRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$GrowthRecordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRecordResponseToJson(this);
}

///  FIXED VERSION
class GrowthDashboardResponse {
  final String status;
  final List<GrowthRecordResponse> records;
  final GrowthRecordResponse? latestRecord;

  GrowthDashboardResponse({
    required this.status,
    required this.records,
    this.latestRecord,
  });

  factory GrowthDashboardResponse.fromJson(Map<String, dynamic> json) {

    ///  FIX هنا
    final rawData = json['data'];

    /// لو data null أو مش Map → نرجع empty safe
    if (rawData is! Map<String, dynamic>) {
      return GrowthDashboardResponse(
        status: json['status']?.toString() ?? '',
        records: [],
        latestRecord: null,
      );
    }

    final data = rawData;

    final rawRecords = data['records'] as List<dynamic>? ?? [];

    final records = rawRecords
        .map((e) => GrowthRecordResponse.fromJson(e as Map<String, dynamic>))
        .toList();

    final rawLatest = data['latestRecord'];

    final latestRecord = rawLatest != null
        ? GrowthRecordResponse.fromJson(rawLatest as Map<String, dynamic>)
        : null;

    return GrowthDashboardResponse(
      status: json['status']?.toString() ?? '',
      records: records,
      latestRecord: latestRecord,
    );
  }
}