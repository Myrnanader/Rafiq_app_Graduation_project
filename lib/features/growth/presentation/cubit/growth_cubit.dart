import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/growth_record_request.dart';
import '../../data/repository/growth_repository.dart';
import 'growth_state.dart';

class GrowthCubit extends Cubit<GrowthState> {
  final GrowthRepository _repository;

  GrowthCubit(this._repository) : super(GrowthInitial());

  // ─── ADD ──────────────────────────────────────────────────

  Future<void> addGrowthRecord(GrowthRecordRequest request) async {
    emit(GrowthLoading());
    try {
      await _repository.createGrowthRecord(request);

      ///  بنرجع الـ childId عشان الـ screen تروح للـ tracker بيه
      emit(GrowthAddSuccess(request.childId));
    } catch (error) {
      emit(GrowthError(
        error is ErrorModel ? error : ErrorModel(message: "Unexpected error"),
      ));
    }
  }

  // ─── GET ──────────────────────────────────────────────────

  Future<void> getGrowthRecords(String childId) async {
    emit(GrowthLoading());
    try {
      final dashboard = await _repository.getGrowthRecords(childId);

      emit(GrowthLoaded(
        records: dashboard.records,
        latestRecord: dashboard.latestRecord,
      ));
    } catch (error) {
      emit(GrowthError(
        error is ErrorModel ? error : ErrorModel(message: "Unexpected error"),
      ));
    }
  }
}