import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/delivery_prediction_repository.dart';
import 'delivery_prediction_state.dart';


class DeliveryPredictionCubit extends Cubit<DeliveryPredictionState> {
  DeliveryPredictionCubit({required this.repository})
      : super(const DeliveryPredictionInitial());

  final DeliveryPredictionRepository repository;

  static const int featuresCount = 12;

  static const Map<int, List<int>> stepFeatureIndices = {
    0: [6, 0, 3, 8], // gestation, fetal_compromise, twins_or_more, antepartum_haemorrhage
    1: [9, 1, 2, 7], // pre_eclampsia, previous_uterine_surgery, no_of_previous_csections, multiple_pregnancy
    2: [4, 5, 11, 10], // height, parity, diastolic_blood_pressure, systolic_blood_pressure
  };

  final List<double?> features = List.filled(featuresCount, null);

  void updateFeature(int index, double value) {
    if (index < 0 || index >= featuresCount) return;
    features[index] = value;
  }

  bool isComplete() {
    return features.every((value) => value != null);
  }

  bool isStepComplete(int step) {
    final indices = stepFeatureIndices[step];
    if (indices == null) return false;
    return indices.every((i) => features[i] != null);
  }

  Future<void> predict() async {
    if (!isComplete()) {
      emit(const DeliveryPredictionError(
        'Answer all questions please',
      ));
      return;
    }

    emit(const DeliveryPredictionLoading());

    try {
      final response = await repository.predictDelivery(features);
      emit(DeliveryPredictionSuccess(response));
    } catch (e) {
      emit(DeliveryPredictionError(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }

  void reset() {
    for (var i = 0; i < featuresCount; i++) {
      features[i] = null;
    }
    emit(const DeliveryPredictionInitial());
  }
}