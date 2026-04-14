import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';
import 'package:rafiq_app/features/growth/data/repository/children_repository.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  final ChildrenRepository repository;

  ChildrenCubit(this.repository) : super(ChildrenInitial());

  Future<void> getChildren() async {
    emit(ChildrenLoading());

    try {
      final children = await repository.getChildren();
      emit(ChildrenSuccess(children));
    } catch (e) {
      emit(
        ChildrenError(
          e is ErrorModel ? e.message : "Something went wrong",
        ),
      );
    }
  }
}