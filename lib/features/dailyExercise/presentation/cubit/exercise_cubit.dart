import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/exercise_model.dart';
import '../../data/repository/exercise_repository.dart';
import 'exercise_state.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  final ExercisesRepository repo;
  int currentTrimester = 1;

  ExercisesCubit(this.repo) : super(ExercisesInitial());


  void setTrimester(int value) {
    currentTrimester = value;
  }

  /// GET
  Future<void> getByTrimester(int trimester) async {
    emit(ExercisesLoading());

    try {
      final data = await repo.getByTrimester(trimester);
      emit(ExercisesLoaded(List<ExerciseModel>.from(data)));
    } catch (e) {
      emit(ExercisesError(e.toString()));
    }
  }

  /// CREATE
  Future<void> createExercise({
    required String title,
    required String shortSummary,
    required String fullDescription,
    required int targetTrimester,
    String? imagePath,
  }) async {
    emit(ExerciseCreating());

    try {
      final exercise = await repo.createExercise(
        title: title,
        shortSummary: shortSummary,
        fullDescription: fullDescription,
        targetTrimester: targetTrimester,
        imagePath: imagePath,
      );
      emit(ExerciseCreated(exercise));

    } catch (e) {
      emit(ExerciseCreateError(e.toString()));
    }
  }

  /// DELETE
  Future<void> deleteExercise(String id,
  ) async {
    emit(ExerciseDeleting());

    try {
      await repo.delete(id);

      emit(ExerciseDeleted());

    } catch (e) {
      emit(ExercisesError(e.toString()));
    }
  }
}
