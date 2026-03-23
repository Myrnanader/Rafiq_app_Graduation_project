import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool isSuccess;
  final String message;

  /// ✅ nullable لأن السيرفر بيبعتهم فاضيين "" بعد register
  /// التوكنز بس بتتبعت بعد verify-registration
  final String? token;
  final String? refreshToken;

  RegisterResponse({
    required this.isSuccess,
    required this.message,
    this.token,
    this.refreshToken,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}