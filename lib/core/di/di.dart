import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:rafiq_app/features/motherSettings/data/api/mother_settings_api_service.dart';
import 'package:rafiq_app/features/motherSettings/data/repository/mother_settings_repository.dart';
import 'package:rafiq_app/features/motherSettings/presentation/cubit/mother_settings_cubit.dart';

import '../network/dio_factory.dart';
import '../storage/secure_storage_service.dart';
import '../storage/shared_prefs_service.dart';

import '../../features/auth/data/api/auth_api_service.dart';
import '../../features/auth/data/api/user_api_service.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/user_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  /// ================= STORAGE =================
  await SharedPrefsService.init();

  final secureStorage = SecureStorageService();
  getIt.registerLazySingleton<SecureStorageService>(() => secureStorage);

  /// ================= DIO =================
  final dio = DioFactory.createDio(secureStorage);
  getIt.registerLazySingleton<Dio>(() => dio);

  /// ================= APIs =================

  ///  Auth API
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  ///  User API (Profile)
  getIt.registerLazySingleton<UserApiService>(
    () => UserApiService(getIt<Dio>()),
  );

  /// ================= REPOSITORIES =================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthApiService>()),
  );

  /// ================= CUBITS =================

  ///  Auth Cubit
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt<AuthRepository>(),
      getIt<SecureStorageService>(),
    ),
  );

  ///  User Cubit (Profile)
  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserApiService>()),
  );

  getIt.registerLazySingleton<MotherSettingsApiService>(
  () => MotherSettingsApiService(getIt()),
);

getIt.registerLazySingleton<MotherSettingsRepository>(
  () => MotherSettingsRepository(getIt()),
);

getIt.registerFactory(
  () => MotherSettingsCubit(getIt()),
);
}