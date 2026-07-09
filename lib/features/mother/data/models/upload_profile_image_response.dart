import 'package:json_annotation/json_annotation.dart';
part 'upload_profile_image_response.g.dart';

@JsonSerializable()
class UploadProfileImageResponse {
  final ProfileImageData data;
  UploadProfileImageResponse({required this.data});
  factory UploadProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadProfileImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadProfileImageResponseToJson(this);
}

@JsonSerializable()
class ProfileImageData {
  final String profileImageUrl;
  ProfileImageData({required this.profileImageUrl});
  factory ProfileImageData.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileImageDataToJson(this);
}
