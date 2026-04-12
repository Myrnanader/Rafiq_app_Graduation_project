import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/growth_record_response.dart';

abstract class GrowthState {}

/// ===== Initial =====
class GrowthInitial extends GrowthState {}

/// ===== Loading =====
class GrowthLoading extends GrowthState {}

/// ===== Success (GET) =====
class GrowthLoaded extends GrowthState {
  final List<GrowthRecordResponse> records;

  GrowthLoaded(this.records);
}

/// ===== Success (ADD) =====
class GrowthAddSuccess extends GrowthState {}

/// ===== Error =====
class GrowthError extends GrowthState {
  final ErrorModel error;

  GrowthError(this.error);
}