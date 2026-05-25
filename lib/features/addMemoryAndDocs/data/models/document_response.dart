import 'package:json_annotation/json_annotation.dart';

import 'document_model.dart';

part 'document_response.g.dart';

@JsonSerializable()
class DocumentsResponse {
  final String status;
  final List<DocumentModel> data;

  DocumentsResponse({
    required this.status,
    required this.data,
  });

  factory DocumentsResponse.fromJson(Map<String, dynamic> json) =>
      _$DocumentsResponseFromJson(json);
}
