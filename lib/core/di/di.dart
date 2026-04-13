import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:rafiq_app/features/growth/data/api/children_api_service.dart';
import 'package:rafiq_app/features/growth/data/repository/children_repository.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/children_cubit.dart';
import 'package:rafiq_app/features/mother/data/api/mother_profile_api_service.dart';
import 'package:rafiq_app/features/mother/data/repository/mother_profile_repository.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
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

import 'package:rafiq_app/features/growth/data/api/growth_api_service.dart';
import 'package:rafiq_app/features/growth/data/repository/growth_repository.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_cubit.dart';

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

  getIt.registerLazySingleton<GrowthApiService>(
    () => GrowthApiService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ChildrenApiService>(
    () => ChildrenApiService(getIt<Dio>()),
  );

  /// ================= REPOSITORIES =================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthApiService>()),
  );
  getIt.registerLazySingleton<GrowthRepository>(
    () => GrowthRepository(getIt<GrowthApiService>()),
  );
  getIt.registerLazySingleton<ChildrenRepository>(
    () => ChildrenRepository(getIt()),
  );

  /// ================= CUBITS =================

  ///  Auth Cubit
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<AuthRepository>(), getIt<SecureStorageService>()),
  );

  ///  User Cubit (Profile)
  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserApiService>(), getIt<SecureStorageService>()),
  );

  getIt.registerLazySingleton<MotherSettingsApiService>(
    () => MotherSettingsApiService(getIt()),
  );

  getIt.registerLazySingleton<MotherSettingsRepository>(
    () => MotherSettingsRepository(getIt()),
  );

  getIt.registerFactory(() => MotherSettingsCubit(getIt()));

  getIt.registerLazySingleton<MotherProfileApiService>(
    () => MotherProfileApiService(getIt()),
  );

  getIt.registerLazySingleton<MotherProfileRepository>(
    () => MotherProfileRepository(getIt()),
  );

  getIt.registerFactory(() => MotherProfileCubit(getIt()));

  getIt.registerFactory<GrowthCubit>(
    () => GrowthCubit(getIt<GrowthRepository>()),
  );
  getIt.registerFactory<ChildrenCubit>(() => ChildrenCubit(getIt()));
}
