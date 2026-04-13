import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/growth_record_request.dart';
import '../../data/repository/growth_repository.dart';
import 'growth_state.dart';

class GrowthCubit extends Cubit<GrowthState> {
  final GrowthRepository _repository;

  GrowthCubit(this._repository) : super(GrowthInitial());

  /// ================= ADD =================
  Future<void> addGrowthRecord(
    GrowthRecordRequest request,
  ) async {
    emit(GrowthLoading());

    try {
      await _repository.createGrowthRecord(request);
      emit(GrowthAddSuccess());
    } catch (error) {
      emit(
        GrowthError(
          error is ErrorModel
              ? error
              : ErrorModel(message: "Unexpected error"),
        ),
      );
    }
  }

  /// ================= GET =================
  Future<void> getGrowthRecords(String childId) async {
    emit(GrowthLoading());

    try {
      final records = await _repository.getGrowthRecords(childId);
      emit(GrowthLoaded(records));
    } catch (error) {
      emit(
        GrowthError(
          error is ErrorModel
              ? error
              : ErrorModel(message: "Unexpected error"),
        ),
      );
    }
  }
}