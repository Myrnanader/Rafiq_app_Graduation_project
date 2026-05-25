import 'dart:io';

import '../api/documents_api_service.dart';
import '../models/document_model.dart';

class DocumentsRepository {
  final DocumentsApiService api;

  DocumentsRepository(this.api);

  Future<List<DocumentModel>> getDocuments() async {
    final response = await api.getDocuments();
    return response.data;
  }

  Future<DocumentModel> getDocumentById(String id) {
    return api.getDocumentById(id);
  }

  Future<void> deleteDocument(String id) async {
    await api.deleteDocument(id);
  }

  Future<void> uploadDocument({
    required String title,
    String? description,
    String? date,
    String? filePath,
  }) async {
    await api.uploadDocument(
      title: title,
      description: description,
      date: date,
      file: filePath != null ? File(filePath) : null,
    );
  }
}
