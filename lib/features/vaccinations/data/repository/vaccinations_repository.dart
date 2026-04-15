import '../api/vaccinations_api_service.dart';
import '../models/vaccination_model.dart';

class VaccinationsRepository {
  final VaccinationsApiService api;

  VaccinationsRepository(this.api);

  ///  Get all vaccines
  Future<List<VaccinationModel>> getVaccines(String childId) async {
    final res = await api.getVaccines(childId);
    return res.data;
  }

  ///  Get single vaccine
  Future<VaccinationModel> getVaccineById(String id) async {
    final res = await api.getVaccineById(id);
    return res.data;
  }

  /// Create vaccine
  Future<VaccinationModel> createVaccine(
      Map<String, dynamic> body) async {
    final res = await api.createVaccine(body);
    return res.data;
  }

  ///  Schedule vaccine
  Future<VaccinationModel> scheduleVaccine(
      String id, String date) async {
    final res = await api.scheduleVaccine(
      id,
      {"scheduledDate": date},
    );
    return res.data;
  }

  ///  Mark taken (FIXED ✅)
  Future<VaccinationModel> markTaken(
      String id, String? takenDate) async {
    final res = await api.markTaken(id, takenDate);
    return res.data;
  }

  ///  Delete vaccine
  Future<void> deleteVaccine(String id) async {
    await api.deleteVaccine(id);
  }
}