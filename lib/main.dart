import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/routing/router_generation_config.dart';
import 'core/di/di.dart';
import 'core/storage/shared_prefs_service.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///  Dependency Injection
  await configureDependencies();

  /// Router
  RouterGenerationConfig.initRouter();

  ///  Screen Util
  await ScreenUtil.ensureScreenSize();

  ///  Shared Preferences
  await SharedPrefsService.init();

  ///  System UI
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
        return const MyApp();
      },
    ),
  );
}