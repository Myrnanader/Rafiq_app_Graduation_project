import 'baby_model.dart';

class ChildrenResponse {
  final List<BabyModel> children;

  ChildrenResponse({required this.children});

  factory ChildrenResponse.fromJson(dynamic json) {
    /// case 1: ASP.NET
    if (json is Map<String, dynamic>) {
      final data = json['data'] ??
          json['children'] ??
          json['result'];

      if (data is List) {
        return ChildrenResponse(
          children:
              data.map((e) => BabyModel.fromJson(e)).toList(),
        );
      }
    }

    /// case 2: direct list
    if (json is List) {
      return ChildrenResponse(
        children:
            json.map((e) => BabyModel.fromJson(e)).toList(),
      );
    }

    throw Exception("Invalid response format");
  }
}