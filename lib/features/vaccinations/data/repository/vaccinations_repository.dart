import '../api/vaccinations_api_service.dart';
import '../models/vaccination_model.dart';

class VaccinationsRepository {
  final VaccinationsApiService api;

  VaccinationsRepository(this.api);

  Future<List<VaccinationModel>> getVaccines(String childId) async {
    final res = await api.getVaccines(childId);
    return res.data;
  }

  Future<VaccinationModel> getVaccineById(String id) async {
    final res = await api.getVaccineById(id);
    return res.data;
  }

  Future<VaccinationModel> createVaccine(Map<String, dynamic> body) async {
    final res = await api.createVaccine(body);
    return res.data;
  }

  Future<VaccinationModel> scheduleVaccine(String id, String date) async {
    final res = await api.scheduleVaccine(
      id,
      {"scheduledDate": date},
    );
    return res.data;
  }

  Future<VaccinationModel> markTaken(String id) async {
    final res = await api.markTaken(id, null);
    return res.data;
  }

  Future<void> deleteVaccine(String id) async {
    await api.deleteVaccine(id);
  }
}