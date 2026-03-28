class BabyModel {
  final String nickname;
  final String dateOfBirth;
  final double height;
  final double weight;
  final int gender;

  BabyModel({
    required this.nickname,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.gender,
  });

  factory BabyModel.fromJson(Map<String, dynamic> json) {
    return BabyModel(
      nickname: json['nickname'] ?? json['NickName'] ?? "",
      dateOfBirth: json['dateOfBirth'] ?? json['DateOfBirth'] ?? "",
      height: (json['height'] ?? json['Height'] ?? 0).toDouble(),
      weight: (json['weight'] ?? json['Weight'] ?? 0).toDouble(),
      gender: json['gender'] ?? json['Gender'] ?? 0,
    );
  }
}