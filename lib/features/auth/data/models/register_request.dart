import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String dateOfBirth;
  final String role;
  final String profileType;

  //  هنا التعديل المهم
  @JsonKey(name: "currentPregnancyWeek")
  final int? pregnancyWeek;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.role,
    required this.profileType,
    this.pregnancyWeek,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}