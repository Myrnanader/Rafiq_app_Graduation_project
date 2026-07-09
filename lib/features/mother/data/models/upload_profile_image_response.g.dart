// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProfileImageResponse _$UploadProfileImageResponseFromJson(
  Map<String, dynamic> json,
) => UploadProfileImageResponse(
  data: ProfileImageData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UploadProfileImageResponseToJson(
  UploadProfileImageResponse instance,
) => <String, dynamic>{'data': instance.data};

ProfileImageData _$ProfileImageDataFromJson(Map<String, dynamic> json) =>
    ProfileImageData(profileImageUrl: json['profileImageUrl'] as String);

Map<String, dynamic> _$ProfileImageDataToJson(ProfileImageData instance) =>
    <String, dynamic>{'profileImageUrl': instance.profileImageUrl};
