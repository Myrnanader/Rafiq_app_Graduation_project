import 'package:rafiq_app/features/mother/data/models/post_model.dart';

class PostFeedResponse {
  final String status;
  final int page;
  final int size;
  final List<PostModel> data;

  PostFeedResponse({
    required this.status,
    required this.page,
    required this.size,
    required this.data,
  });

  factory PostFeedResponse.fromJson(Map<String, dynamic> json) {
    return PostFeedResponse(
      status: json["status"],
      page: json["page"],
      size: json["size"],
      data: (json["data"] as List)
          .map((e) => PostModel.fromJson(e))
          .toList(),
    );
  }
}
