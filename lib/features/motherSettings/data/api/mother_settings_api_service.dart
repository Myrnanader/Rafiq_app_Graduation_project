import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'mother_settings_api_service.g.dart';

@RestApi()
abstract class MotherSettingsApiService {
  factory MotherSettingsApiService(Dio dio) =
      _MotherSettingsApiService;

  @PUT('MotherProfile/edit')
  Future<dynamic> editProfile(
    @Body() Map<String, dynamic> body,
  );

  @DELETE('MotherProfile/delete-account')
  Future<dynamic> deleteAccount();
}