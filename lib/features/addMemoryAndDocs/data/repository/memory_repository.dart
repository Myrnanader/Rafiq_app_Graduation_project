import 'package:dio/dio.dart';
import '../api/memories_api_service.dart';
import '../models/memory_model.dart';

class MemoriesRepository {
  final MemoriesApiService api;

  MemoriesRepository(this.api);

  Future<List<MemoryModel>> getMemories() async {
    final response = await api.getMemories();
    return response.data;
  }

  Future<void> deleteMemory(String id) async {
    await api.deleteMemory(id);
  }

  Future<void> uploadMemory({
    required String title,
    String? description,
    String? date,
    String? imagePath,
  }) async {
    MultipartFile? file;

    if (imagePath != null) {
      file = await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      );
    }

    await api.uploadMemory(
      title: title,
      description: description,
      date: date,
      image: file,
    );
  }
}
