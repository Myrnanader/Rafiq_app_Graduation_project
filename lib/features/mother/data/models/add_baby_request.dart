class AddBabyRequest {
  final String nickname;
  final String dateOfBirth;
  final double height;
  final double weight;
  final int gender;

  AddBabyRequest({
    required this.nickname,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "dateOfBirth": dateOfBirth,
        "height": height,
        "weight": weight,
        "gender": gender,
      };
}