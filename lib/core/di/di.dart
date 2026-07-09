import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:rafiq_app/features/cry/data/api/cry_api_service.dart';
import 'package:rafiq_app/features/cry/data/repository/cry_repository.dart';
import 'package:rafiq_app/features/cry/presentation/cubit/cry_cubit.dart';
import 'package:rafiq_app/features/depression/data/api/postpartum_survey_api_service.dart';
import 'package:rafiq_app/features/depression/data/repository/postpartum_survey_repository.dart';
import 'package:rafiq_app/features/depression/presentation/cubit/postpartum_survey_cubit.dart';
import 'package:rafiq_app/features/growth/data/api/children_api_service.dart';
import 'package:rafiq_app/features/growth/data/repository/children_repository.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/children_cubit.dart';
import 'package:rafiq_app/features/mother/data/api/mother_profile_api_service.dart';
import 'package:rafiq_app/features/mother/data/repository/mother_profile_repository.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
import 'package:rafiq_app/features/motherSettings/data/api/mother_settings_api_service.dart';
import 'package:rafiq_app/features/motherSettings/data/repository/mother_settings_repository.dart';
import 'package:rafiq_app/features/motherSettings/presentation/cubit/mother_settings_cubit.dart';
import 'package:rafiq_app/features/vaccinations/data/api/vaccinations_api_service.dart';
import 'package:rafiq_app/features/vaccinations/data/repository/vaccinations_repository.dart';
import 'package:rafiq_app/features/vaccinations/presentation/cubit/vaccinations_cubit.dart';

import '../../features/addMemoryAndDocs/data/api/documents_api_service.dart';
import '../../features/addMemoryAndDocs/data/api/memories_api_service.dart';
import '../../features/addMemoryAndDocs/data/repository/document_repository.dart';
import '../../features/addMemoryAndDocs/data/repository/memory_repository.dart';
import '../../features/addMemoryAndDocs/presentation/cubit/document_cubit.dart';
import '../../features/addMemoryAndDocs/presentation/cubit/memory_cubit.dart';
import '../../features/dailyExercise/data/api/exercises_api_service.dart';
import '../../features/dailyExercise/data/repository/exercise_repository.dart';
import '../../features/dailyExercise/presentation/cubit/exercise_cubit.dart';
import '../../features/foods/data/api/foods_api_service.dart';
import '../../features/foods/data/repository/food_repository.dart';
import '../../features/foods/presentation/cubit/food_cubit.dart';
import '../../features/mother/data/api/mother_profile_photo_api_service.dart';
import '../../features/mother/data/repository/mother_profile_photo_repository.dart';
import '../../features/mother/presentation/cubit/mother_comments_cubit.dart';
import '../../features/mother/presentation/cubit/mother_experiences_cubit.dart';
import '../../features/mother/presentation/cubit/mother_profile_photo_cubit.dart';
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

import 'package:rafiq_app/features/mother/data/api/mother_posts_api_service.dart';
import 'package:rafiq_app/features/mother/data/repository/mother_posts_repository.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_posts_cubit.dart';

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
  getIt.registerLazySingleton<PostpartumSurveyApiService>(
    () => PostpartumSurveyApiService(getIt()),
  );
  getIt.registerLazySingleton<VaccinationsApiService>(
    () => VaccinationsApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<PostsApiService>(
    () => PostsApiService(getIt<Dio>()),
  );

  /// Documents API
  getIt.registerLazySingleton<DocumentsApiService>(
    () => DocumentsApiService(getIt<Dio>()),
  );

  /// Memories API
  getIt.registerLazySingleton<MemoriesApiService>(
    () => MemoriesApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<FoodsApiService>(
    () => FoodsApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ExercisesApiService>(
    () => ExercisesApiService(getIt<Dio>()),
  );
  /// ================= PROFILE IMAGE API =================

  getIt.registerLazySingleton<MotherProfilePhotoApiService>(
        () => MotherProfilePhotoApiService(
      getIt<Dio>(),
    ),
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

  getIt.registerLazySingleton<PostpartumSurveyRepository>(
    () => PostpartumSurveyRepository(getIt()),
  );
  getIt.registerLazySingleton<VaccinationsRepository>(
    () => VaccinationsRepository(getIt()),
  );

  getIt.registerLazySingleton<PostsRepository>(
    () => PostsRepository(getIt<PostsApiService>()),
  );

  /// Dos Repo
  getIt.registerLazySingleton<DocumentsRepository>(
    () => DocumentsRepository(getIt<DocumentsApiService>()),
  );

  /// Memories Repo
  getIt.registerLazySingleton<MemoriesRepository>(
    () => MemoriesRepository(getIt<MemoriesApiService>()),
  );

  getIt.registerLazySingleton<FoodsRepository>(() => FoodsRepository(getIt()));

  getIt.registerLazySingleton<ExercisesRepository>(
    () => ExercisesRepository(getIt()),
  );

  getIt.registerLazySingleton<MotherProfilePhotoRepository>(
        () => MotherProfilePhotoRepository(
      getIt<MotherProfilePhotoApiService>(),
    ),
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

  getIt.registerFactory(() => PostpartumSurveyCubit(getIt()));
  getIt.registerFactory<VaccinationsCubit>(() => VaccinationsCubit(getIt()));

  /// Posts Cubit
  getIt.registerFactory<PostsCubit>(() => PostsCubit(getIt<PostsRepository>()));

  getIt.registerFactory<ExperiencesCubit>(
    () => ExperiencesCubit(getIt<PostsRepository>()),
  );

  /// Docs Cubit
  getIt.registerFactory<DocumentsCubit>(
    () => DocumentsCubit(getIt<DocumentsRepository>()),
  );

  /// Memories Cubit
  getIt.registerFactory<MemoriesCubit>(
    () => MemoriesCubit(getIt<MemoriesRepository>()),
  );

  getIt.registerFactory(() => FoodsCubit(getIt()));

  getIt.registerFactory<ExercisesCubit>(
    () => ExercisesCubit(getIt<ExercisesRepository>()),
  );

  getIt.registerFactory<CommentsCubit>(
    () => CommentsCubit(getIt<PostsRepository>(), getIt<PostsCubit>()),
  );

  getIt.registerLazySingleton<CryApiService>(
  () => CryApiService(getIt<Dio>()),
);

getIt.registerLazySingleton<CryRepository>(
  () => CryRepository(
    getIt<CryApiService>(),
  ),
);

getIt.registerFactory(
  () => CryCubit(
    getIt<CryRepository>(),
  ),
);


  /// ================= PROFILE IMAGE CUBIT =================

  getIt.registerFactory<ProfileImageCubit>(
        () => ProfileImageCubit(
      getIt<MotherProfilePhotoRepository>(),
    ),
  );

}
