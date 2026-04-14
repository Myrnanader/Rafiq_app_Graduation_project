import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/vaccination_model.dart';
import '../../data/repository/vaccinations_repository.dart';
import 'vaccinations_state.dart';

class VaccinationsCubit extends Cubit<VaccinationsState> {
  final VaccinationsRepository repo;

  VaccinationsCubit(this.repo) : super(VaccinationsInitial());

  List<VaccinationModel> vaccines = [];

  /// 🔹 GET vaccines
  Future<void> getVaccines(String childId) async {
    emit(VaccinationsLoading());

    try {
      final result = await repo.getVaccines(childId);
      vaccines = result;
      emit(VaccinationsSuccess(vaccines));
    } catch (e) {
      emit(VaccinationsError(e.toString()));
    }
  }

  /// 🔹 Schedule vaccine
  Future<void> scheduleVaccine(String id, String date) async {
    emit(VaccinationActionLoading());

    try {
      final updated = await repo.scheduleVaccine(id, date);

      _updateLocal(updated);

      emit(VaccinationActionSuccess());
      emit(VaccinationsSuccess(vaccines));
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }

  /// 🔹 Mark taken
  Future<void> markTaken(String id) async {
    emit(VaccinationActionLoading());

    try {
      final updated = await repo.markTaken(id);

      _updateLocal(updated);

      emit(VaccinationActionSuccess());
      emit(VaccinationsSuccess(vaccines));
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }

  /// 🔹 Delete vaccine
  Future<void> deleteVaccine(String id) async {
    emit(VaccinationActionLoading());

    try {
      await repo.deleteVaccine(id);

      vaccines.removeWhere((e) => e.id == id);

      emit(VaccinationActionSuccess());
      emit(VaccinationsSuccess(vaccines));
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }

  ///  Update local list after API
  void _updateLocal(VaccinationModel updated) {
    final index = vaccines.indexWhere((e) => e.id == updated.id);

    if (index != -1) {
      vaccines[index] = updated;
    }
  }
}