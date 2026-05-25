import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/document_model.dart';
import '../../data/repository/document_repository.dart';

part 'document_state.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  final DocumentsRepository repository;

  DocumentsCubit(this.repository) : super(DocumentsInitial());

  /// GET ALL DOCUMENTS
  Future<void> getDocuments() async {
    emit(DocumentsLoading());

    try {
      final documents = await repository.getDocuments();
      emit(DocumentsSuccess(documents));
    } catch (e) {
      emit(
        DocumentsError(
          e is ErrorModel ? e.message : "Unexpected error",
        ),
      );
    }
  }

  /// GET BY ID
  Future<void> getDocumentById(String id) async {
    emit(DocumentsLoading());

    try {
      final document = await repository.getDocumentById(id);
      emit(DocumentDetailsSuccess(document));
    } catch (e) {
      emit(
        DocumentsError(
          e is ErrorModel ? e.message : "Unexpected error",
        ),
      );
    }
  }

  /// UPLOAD DOCUMENT
  Future<void> uploadDocument({
    required String title,
    String? description,
    String? date,
    String? filePath,
  }) async {
    emit(UploadDocumentLoading());

    try {
      await repository.uploadDocument(
        title: title,
        description: description,
        date: date,
        filePath: filePath,
      );

      emit(UploadDocumentSuccess());

      // refresh list automatically (like auth flow pattern)
      await getDocuments();
    } catch (e) {
      emit(
        DocumentsError(
          e is ErrorModel ? e.message : "Unexpected error",
        ),
      );
    }
  }

  /// DELETE DOCUMENT
  Future<void> deleteDocument(String id) async {
    emit(DocumentsLoading());

    try {
      await repository.deleteDocument(id);

      // refresh list (same pattern as production apps)
      await getDocuments();
    } catch (e) {
      emit(
        DocumentsError(
          e is ErrorModel ? e.message : "Unexpected error",
        ),
      );
    }
  }
}
