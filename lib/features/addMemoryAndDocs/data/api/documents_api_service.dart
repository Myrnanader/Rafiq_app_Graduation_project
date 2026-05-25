import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/document_model.dart';
import '../models/basic_response.dart';
import '../models/document_response.dart';

part 'documents_api_service.g.dart';

@RestApi()
abstract class DocumentsApiService {
  factory DocumentsApiService(Dio dio, {String baseUrl}) =
  _DocumentsApiService;

  /// GET ALL DOCUMENTS
  @GET("documents")
  Future<DocumentsResponse> getDocuments();

  /// GET DOCUMENT BY ID
  @GET("documents/{id}")
  Future<DocumentModel> getDocumentById(@Path("id") String id);

  /// DELETE DOCUMENT
  @DELETE("documents/{id}")
  Future<BasicResponse> deleteDocument(@Path("id") String id);

  /// UPLOAD DOCUMENT (multipart)
  @MultiPart()
  @POST("documents")
  Future<BasicResponse> uploadDocument({
    @Part(name: "Title") required String title,
    @Part(name: "Description") String? description,
    @Part(name: "Date") String? date,
    @Part(name: "File") File? file,
  });
}
