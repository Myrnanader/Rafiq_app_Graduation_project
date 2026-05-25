import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  final String id;
  final String title;
  final String? description;
  final String? date;
  final String? fileUrl;

  DocumentModel({
    required this.id,
    required this.title,
    this.description,
    this.date,
    this.fileUrl,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  String? get fullImageUrl {
    if (fileUrl == null || fileUrl!.isEmpty) return null;

    final cleanedPath = fileUrl!.startsWith("/")
        ? fileUrl!.substring(1)
        : fileUrl!;

    return "https://rafiq.runasp.net/$cleanedPath";
  }

}
