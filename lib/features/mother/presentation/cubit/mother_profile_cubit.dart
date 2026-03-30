import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/add_baby_request.dart';
import '../../data/models/link_father_request.dart';
import '../../data/repository/mother_profile_repository.dart';
import 'mother_profile_state.dart';

class MotherProfileCubit extends Cubit<MotherProfileState> {
  final MotherProfileRepository repository;

  MotherProfileCubit(this.repository)
      : super(MotherProfileInitial());

  Future<void> getChildren() async {
    emit(ChildrenLoading());

    try {
      final response = await repository.getChildren();
      emit(ChildrenLoaded(response.children));
    } catch (e) {
      emit(ChildrenError(e.toString()));
    }
  }

  Future<void> addBaby(AddBabyRequest request) async {
    emit(AddBabyLoading());

    try {
      await repository.addBaby(request);
      emit(AddBabySuccess());
      await getChildren();
    } catch (e) {
      emit(AddBabyError(e.toString()));
    }
  }

  Future<void> linkFather(LinkFatherRequest request) async {
    emit(LinkFatherLoading());

    try {
      await repository.linkFather(request);
      emit(LinkFatherSuccess());
    } catch (e) {
      emit(LinkFatherError(e.toString()));
    }
  }
}