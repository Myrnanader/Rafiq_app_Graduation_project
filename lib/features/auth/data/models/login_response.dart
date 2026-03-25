import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

///  فقط الـ fields اللي الـ backend بيرجعها فعلاً في login
/// الـ backend مش بيرجع fullName أو pregnancyWeek هنا
@JsonSerializable()
class LoginResponse {
  final bool isSuccess;
  final String message;

  /// nullable لأن السيرفر بيبعتهم "" لما يفشل
  final String? token;
  final String? refreshToken;

  LoginResponse({
    required this.isSuccess,
    required this.message,
    this.token,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}