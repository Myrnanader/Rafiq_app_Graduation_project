import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool isSuccess;
  final String message;

  /// ✅ nullable لأن السيرفر بيبعتهم فاضيين "" لما يفشل
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