import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/mother_posts_repository.dart';
import 'mother_experiences_state.dart';

class ExperiencesCubit extends Cubit<ExperiencesState> {
  final PostsRepository repo;

  ExperiencesCubit(this.repo) : super(ExperiencesInitial());

  Future<void> getExperiences({int page = 1}) async {
    emit(ExperiencesLoading());
    try {
      final data = await repo.getExperiences(page);
      emit(ExperiencesLoaded(data));
    } catch (e) {
      emit(ExperiencesError(e.toString()));
    }
  }

  Future<void> addExperience(String challenge, String solution) async {
    await repo.createExperience(challenge, solution);
    await getExperiences(); // refresh
  }

  Future<void> toggleLike(String id) async {
    try {
      await repo.toggleLike(id);
      if (state is ExperiencesLoaded) {
        final current = (state as ExperiencesLoaded).experiences;

        final updated = current.map((experience) {
          if (experience.id == id) {
            final newLiked = !experience.isLikedByMe;

            return experience.copyWith(
              isLikedByMe: newLiked,
              likeCount: experience.likeCount + (newLiked ? 1 : -1),
            );
          }
          return experience;
        }).toList();

        emit(ExperiencesLoaded(updated));
      }
    } catch (e) {
      print("Error in toggleLike: $e");
    }
  }

  Future<void> toggleSave(String id) async {
    try {
      await repo.toggleSave(id);

      if (state is ExperiencesLoaded) {
        final current = (state as ExperiencesLoaded).experiences;

        final updated = current.map((experience) {
          if (experience.id == id) {
            return experience.copyWith(
              isSavedByMe: !experience.isSavedByMe,
            );
          }
          return experience;
        }).toList();

        emit(ExperiencesLoaded(updated));
      }
    }catch (e) {
      print("Error in toggleSave: $e");
    }
  }
}
