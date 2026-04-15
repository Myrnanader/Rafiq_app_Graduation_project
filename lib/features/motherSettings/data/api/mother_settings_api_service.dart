import 'package:dio/dio.dart';
import 'package:rafiq_app/features/auth/data/models/basic_response.dart';
import 'package:retrofit/retrofit.dart';


part 'mother_settings_api_service.g.dart';

@RestApi()
abstract class MotherSettingsApiService {
  factory MotherSettingsApiService(Dio dio) =
      _MotherSettingsApiService;

  /// EDIT PROFILE
  @PUT('motherprofile/edit')
  Future<BasicResponse> editProfile(
    @Body() Map<String, dynamic> body,
  );

  /// DELETE ACCOUNT
 @DELETE('motherprofile/delete-account')
Future<BasicResponse> deleteAccount(
  @Body() Map<String, dynamic> body,
);

  /// MAKE ADMIN
  @POST('mother/settings/make-admin')
  Future<BasicResponse> makeAdmin(
    @Body() Map<String, dynamic> body,
  );
}