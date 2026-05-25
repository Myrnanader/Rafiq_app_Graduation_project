import 'package:json_annotation/json_annotation.dart';
import 'memory_model.dart';

part 'memory_response.g.dart';

@JsonSerializable()
class MemoriesResponse {
  final String status;
  final List<MemoryModel> data;

  MemoriesResponse({
    required this.status,
    required this.data,
  });

  factory MemoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$MemoriesResponseFromJson(json);
}
