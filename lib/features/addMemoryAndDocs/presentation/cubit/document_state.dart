part of 'document_cubit.dart';

abstract class DocumentsState {}

/// INITIAL
class DocumentsInitial extends DocumentsState {}

/// LOADING (fetch all documents)
class DocumentsLoading extends DocumentsState {}

/// SUCCESS (get all documents)
class DocumentsSuccess extends DocumentsState {
  final List<DocumentModel> documents;

  DocumentsSuccess(this.documents);
}

/// SINGLE DOCUMENT LOADED
class DocumentDetailsSuccess extends DocumentsState {
  final DocumentModel document;

  DocumentDetailsSuccess(this.document);
}

class UploadDocumentLoading extends DocumentsState {}

/// UPLOAD SUCCESS
class UploadDocumentSuccess extends DocumentsState {}

/// DELETE SUCCESS
class DeleteDocumentSuccess extends DocumentsState {}

/// ERROR
class DocumentsError extends DocumentsState {
  final String message;

  DocumentsError(this.message);
}
