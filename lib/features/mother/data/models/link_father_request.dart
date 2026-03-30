// features/mother/data/models/link_father_request.dart

class LinkFatherRequest {
  final String fatherEmail;

  LinkFatherRequest({
    required this.fatherEmail,
  });

  Map<String, dynamic> toJson() => {
        "fatherEmail": fatherEmail,
      };
}