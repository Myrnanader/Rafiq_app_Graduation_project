import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/memory_model.dart';
import '../../data/repository/memory_repository.dart';

part 'memory_state.dart';

class MemoriesCubit extends Cubit<MemoriesState> {
  final MemoriesRepository repository;

  MemoriesCubit(this.repository) : super(MemoriesInitial());

  Future<void> getMemories() async {
    emit(MemoriesLoading());

    try {
      final data = await repository.getMemories();
      emit(MemoriesSuccess(data));
    } catch (e) {
      emit(MemoriesError("Unexpected error"));
    }
  }

  Future<void> uploadMemory({
    required String title,
    String? description,
    String? date,
    String? imagePath,
  }) async {
    emit(MemoriesLoading());

    try {
      await repository.uploadMemory(
        title: title,
        description: description,
        date: date,
        imagePath: imagePath,
      );

      emit(UploadMemorySuccess());

      await getMemories(); // refresh
    } catch (e) {
      emit(MemoriesError("Upload failed"));
    }
  }

  Future<void> deleteMemory(String id) async {
    emit(MemoriesLoading());

    try {
      await repository.deleteMemory(id);
      emit(DeleteMemorySuccess());
      await getMemories();
    } catch (e) {
      emit(MemoriesError("Delete failed"));
    }
  }
}
