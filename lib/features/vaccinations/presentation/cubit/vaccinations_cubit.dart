import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/vaccination_model.dart';
import '../../data/repository/vaccinations_repository.dart';
import 'vaccinations_state.dart';

class VaccinationsCubit extends Cubit<VaccinationsState> {
  final VaccinationsRepository repo;

  String? childId;
  List<VaccinationModel> vaccines = [];

  VaccinationsCubit(this.repo) : super(VaccinationsInitial());

  Future<void> getVaccines(String childId) async {
    this.childId = childId;

    emit(VaccinationsLoading());
    try {
      final result = await repo.getVaccines(childId);
      vaccines = result;

      emit(VaccinationsSuccess(List.from(vaccines)));
    } catch (e) {
      emit(VaccinationsError(e.toString()));
    }
  }

  /// 🔵 Schedule
  Future<void> scheduleVaccine(String id, String date) async {
    emit(VaccinationActionLoading());

    try {
      await repo.scheduleVaccine(id, date);

      emit(VaccinationActionSuccess());

      if (childId != null) {
        getVaccines(childId!);
      }
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }

  /// 🟢 Mark Taken
  Future<void> markTaken(String id) async {
    emit(VaccinationActionLoading());

    try {
      final now = DateTime.now().toIso8601String();

      await repo.markTaken(id, now);

      if (childId != null) {
        await getVaccines(childId!);
      }
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }

  /// 🔴 Delete
  Future<void> deleteVaccine(String id) async {
    emit(VaccinationActionLoading());

    try {
      await repo.deleteVaccine(id);

      await repo.deleteVaccine(id);

      emit(VaccinationActionSuccess());

      if (childId != null) {
        getVaccines(childId!);
      }
    } catch (e) {
      emit(VaccinationActionError(e.toString()));
    }
  }
}
