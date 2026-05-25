import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/routing/router_generation_config.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/user_cubit.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/views/experience_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/cubit/vaccinations_cubit.dart';
import 'core/di/di.dart';
import 'core/storage/shared_prefs_service.dart';
import 'features/dailyExercise/data/api/exercises_api_service.dart';
import 'features/dailyExercise/data/repository/exercise_repository.dart';
import 'features/dailyExercise/presentation/cubit/exercise_cubit.dart';
import 'features/mother/presentation/cubit/mother_experiences_cubit.dart';
import 'features/mother/presentation/cubit/mother_posts_cubit.dart';
import 'my_app.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rafiq_app/features/auth/data/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  RouterGenerationConfig.initRouter();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefsService.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit(AuthRepository(getIt()), getIt()),
            ),
            BlocProvider(create: (_) => getIt<UserCubit>()..getProfile()),
            BlocProvider(
              create: (_) => getIt<ExercisesCubit>(),
            ),

            BlocProvider(create: (_) => getIt<GrowthCubit>()),
            BlocProvider(create: (_) => getIt<ExperiencesCubit>()),
            BlocProvider(create: (_) => getIt<VaccinationsCubit>()),
            BlocProvider(
              create: (_) => getIt<PostsCubit>(),
            ),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}
