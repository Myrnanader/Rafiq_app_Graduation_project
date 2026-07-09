import 'package:equatable/equatable.dart';

import '../../data/models/delivery_prediction_response.dart';

abstract class DeliveryPredictionState extends Equatable {
  const DeliveryPredictionState();

  @override
  List<Object?> get props => [];
}

class DeliveryPredictionInitial extends DeliveryPredictionState {
  const DeliveryPredictionInitial();
}

class DeliveryPredictionLoading extends DeliveryPredictionState {
  const DeliveryPredictionLoading();
}

class DeliveryPredictionSuccess extends DeliveryPredictionState {
  const DeliveryPredictionSuccess(this.response);

  final DeliveryPredictionResponse response;

  @override
  List<Object?> get props => [response];
}

class DeliveryPredictionError extends DeliveryPredictionState {
  const DeliveryPredictionError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}