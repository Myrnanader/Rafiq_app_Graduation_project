import 'package:json_annotation/json_annotation.dart';
import 'post_model.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class PostsResponse {
  final String status;
  final int page;
  final int size;
  final List<PostModel> data;

  PostsResponse({
    required this.status,
    required this.page,
    required this.size,
    required this.data,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);
}
