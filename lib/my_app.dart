import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/routing/router_generation_config.dart';

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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          /// Themes (static مؤقتًا)
          theme: getLightTheme(context),
          darkTheme: getDarkTheme(context),
          themeMode: ThemeMode.light,

          /// Routing
          routerConfig: RouterGenerationConfig.router,
        );
      },
    );
  }
}