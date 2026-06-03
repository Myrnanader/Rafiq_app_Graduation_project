import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final ProfileData? data;

  ProfileResponse({this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  ///  helpers (safe)
  String get fullName => data?.user?.name ?? "";

  String get dateOfBirth => data?.user?.dateOfBirth ?? "";

  int get pregnancyWeek =>
      data?.motherProfile?.currentPregnancyWeek ?? 0;

  String? get fullImageUrl {
    final img = data?.user?.image;
    if (img == null || img.isEmpty) return null;
    if (img.startsWith("http")) return img;
    return "https://rafiq.runasp.net/$img";
  }

  String get role => data?.user?.role ?? "";
}

@JsonSerializable()
class ProfileData {
  final User? user;

  @JsonKey(name: "motherProfile")
  final MotherProfile? motherProfile;

  ProfileData({this.user, this.motherProfile});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class User {
  final String? name;

  @JsonKey(name: "dateOfBirth")
  final String? dateOfBirth; 

  final String? image;

  final String? role;

  User({this.name, this.dateOfBirth, this.image, this.role});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class MotherProfile {
  final int? currentPregnancyWeek;

  MotherProfile({this.currentPregnancyWeek});

  factory MotherProfile.fromJson(Map<String, dynamic> json) =>
      _$MotherProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MotherProfileToJson(this);
}