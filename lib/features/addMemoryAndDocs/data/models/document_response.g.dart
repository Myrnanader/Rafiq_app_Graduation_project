// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentsResponse _$DocumentsResponseFromJson(Map<String, dynamic> json) =>
    DocumentsResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentsResponseToJson(DocumentsResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
