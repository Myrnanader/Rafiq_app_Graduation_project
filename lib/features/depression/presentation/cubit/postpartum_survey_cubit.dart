import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/postpartum_survey_repository.dart';
import 'postpartum_survey_state.dart';

class PostpartumSurveyCubit extends Cubit<PostpartumSurveyState> {
  final PostpartumSurveyRepository repo;

  PostpartumSurveyCubit(this.repo) : super(SurveyInitial());

  /// ✅ 10 answers
  List<int> answers = List.filled(10, -1);

  void updateAnswer(int index, int value) {
    answers[index] = value;
  }

  bool isComplete() {
    return !answers.contains(-1);
  }

  Future<void> submit() async {
    if (!isComplete()) {
      emit(SurveyError("Please answer all questions"));
      return;
    }

    emit(SurveyLoading());

    try {
      final response = await repo.submitSurvey(answers);

      emit(SurveySuccess(
        response.totalScore,
        response.riskLevel,
      ));
    } catch (e) {
      emit(SurveyError("Failed to submit survey"));
    }
  }
}