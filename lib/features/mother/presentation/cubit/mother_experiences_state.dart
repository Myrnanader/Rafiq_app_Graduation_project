import '../../data/models/post_model.dart';

abstract class ExperiencesState {}

class ExperiencesInitial extends ExperiencesState {}

class ExperiencesLoading extends ExperiencesState {}

class ExperiencesLoaded extends ExperiencesState {
  final List<PostModel> experiences;

  ExperiencesLoaded(this.experiences);
}

class ExperiencesError extends ExperiencesState {
  final String message;

  ExperiencesError(this.message);
}
