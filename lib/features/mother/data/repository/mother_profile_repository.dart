import 'package:dio/dio.dart';

import '../api/mother_profile_api_service.dart';
import '../models/add_baby_request.dart';
import '../models/link_father_request.dart';
import '../models/children_response.dart';

class MotherProfileRepository {
  final MotherProfileApiService api;

  MotherProfileRepository(this.api);

  Future<ChildrenResponse> getChildren() async {
    try {
      final response = await api.getChildren();

      print("RAW RESPONSE: $response");

      return ChildrenResponse.fromJson(response);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Failed to fetch children");
    }
  }

  Future<void> addBaby(AddBabyRequest request) async {
    try {
      await api.addBaby(request);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Failed to add baby");
    }
  }

  Future<void> linkFather(LinkFatherRequest request) async {
    try {
      await api.linkFather(request);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Failed to link father");
    }
  }
}