import 'package:dio/dio.dart';

import '../api/exercises_api_service.dart';
import '../models/exercise_model.dart';

class ExercisesRepository {
  final ExercisesApiService api;

  ExercisesRepository(this.api);

  Future<List<ExerciseModel>> getByTrimester(int trimester) async {
    final response = await api.getExercisesByTrimester(trimester);
    return response.data;
  }

  Future<ExerciseModel> getById(String id) async {
    final response = await api.getExerciseById(id);
    return response.data;
  }

  Future<void> delete(String id) async {
    await api.deleteExercise(id);
  }

  Future<ExerciseModel> createExercise({
    required String title,
    required String shortSummary,
    required String fullDescription,
    required int targetTrimester,
    String? imagePath,
  }) async {
    MultipartFile? imageFile;

    if (imagePath != null) {
      imageFile = await MultipartFile.fromFile(imagePath);
    }

    final response = await api.createExercise(
      title: title,
      shortSummary: shortSummary,
      fullDescription: fullDescription,
      targetTrimester: targetTrimester,
      image: imageFile,
    );

    return response.data;
  }
}

