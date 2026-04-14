import 'package:json_annotation/json_annotation.dart';

part 'child_response.g.dart';

@JsonSerializable()
class ChildResponse {
  final String id;
  final String nickname;
  final String dateOfBirth;
  final double height;
  final double weight;
  final int gender;

  ChildResponse({
    required this.id,
    required this.nickname,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.gender,
  });

  factory ChildResponse.fromJson(Map<String, dynamic> json) =>
      _$ChildResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChildResponseToJson(this);
}

@JsonSerializable()
class ChildrenResponseWrapper {
  final String status;
  final List<ChildResponse> data;

  ChildrenResponseWrapper({
    required this.status,
    required this.data,
  });

  factory ChildrenResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ChildrenResponseWrapperFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChildrenResponseWrapperToJson(this);
}