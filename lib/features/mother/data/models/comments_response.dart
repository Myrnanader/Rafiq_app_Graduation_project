import 'package:json_annotation/json_annotation.dart';
import 'comment_model.dart';

part 'comments_response.g.dart';

@JsonSerializable()
class CommentsResponse {
  final String status;
  final int? page;
  final int? size;
  final List<CommentModel> data;

  CommentsResponse({
    required this.status,
    this.page,
    this.size,
    required this.data,
  });

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}
