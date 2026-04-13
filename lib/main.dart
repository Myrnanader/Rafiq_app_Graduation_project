import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/routing/router_generation_config.dart';
import 'core/di/di.dart';
import 'core/storage/shared_prefs_service.dart';
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
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit(
                AuthRepository(getIt()),
                getIt(),
              ),
            ),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}