import 'package:rafiq_app/features/vaccinations/data/models/vaccination_model.dart';

abstract class VaccinationsState {}

/// Initial
class VaccinationsInitial extends VaccinationsState {}

/// Loading list
class VaccinationsLoading extends VaccinationsState {}

/// Success list
class VaccinationsSuccess extends VaccinationsState {
  final List<VaccinationModel> vaccinations;

  VaccinationsSuccess(this.vaccinations);
}

/// Error
class VaccinationsError extends VaccinationsState {
  final String message;

  VaccinationsError(this.message);
}

/// Action Loading (schedule / mark / delete)
class VaccinationActionLoading extends VaccinationsState {}

/// Action Success
class VaccinationActionSuccess extends VaccinationsState {}

/// Action Error
class VaccinationActionError extends VaccinationsState {
  final String message;

  VaccinationActionError(this.message);
}