import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/router_generation_config.dart';
import 'package:rafiq_app/features/motherSettings/presentation/cubit/mother_settings_cubit.dart';

import 'core/theme/theme_data/dark_them_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
        BlocProvider(
          create: (_) => getIt<MotherSettingsCubit>(),
        ),
      ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,

            /// Themes (static مؤقتًا)
            theme: getLightTheme(context),
            darkTheme: getDarkTheme(context),
            themeMode: ThemeMode.light,

            /// Routing
            routerConfig: RouterGenerationConfig.router,
          ),
        );
      },
    );
  }
}
