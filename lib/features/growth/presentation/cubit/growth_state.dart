import 'package:rafiq_app/core/errors/error_model.dart';
import '../../data/models/growth_record_response.dart';

abstract class GrowthState {}

class GrowthInitial extends GrowthState {}

class GrowthLoading extends GrowthState {}

///  بيحمل الـ dashboard كامل (records + latestRecord)
class GrowthLoaded extends GrowthState {
  final List<GrowthRecordResponse> records;
  final GrowthRecordResponse? latestRecord;

  GrowthLoaded({
    required this.records,
    this.latestRecord,
  });
}

class GrowthAddSuccess extends GrowthState {
  ///  بنرجع الـ childId عشان نعرف نروح للـ tracker الصح
  final String childId;
  GrowthAddSuccess(this.childId);
}

class GrowthError extends GrowthState {
  final ErrorModel error;
  GrowthError(this.error);
}