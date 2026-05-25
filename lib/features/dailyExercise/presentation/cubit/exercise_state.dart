import '../../data/models/exercise_model.dart';

abstract class ExercisesState {}

/// GET
class ExercisesInitial extends ExercisesState {}

class ExercisesLoading extends ExercisesState {}

class ExercisesLoaded extends ExercisesState {
  final List<ExerciseModel> exercises;

  ExercisesLoaded(this.exercises);
}

class ExercisesError extends ExercisesState {
  final String message;

  ExercisesError(this.message);
}

/// CREATE
class ExerciseCreating extends ExercisesState {}

class ExerciseCreated extends ExercisesState {
  final ExerciseModel exercise;

  ExerciseCreated(this.exercise);
}

class ExerciseCreateError extends ExercisesState {
  final String message;

  ExerciseCreateError(this.message);
}

/// DELETE
class ExerciseDeleting extends ExercisesState {}

class ExerciseDeleted extends ExercisesState {}
