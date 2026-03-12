<<<<<<< HEAD
=======
// splash_screen.dart
>>>>>>> origin/development
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
<<<<<<< HEAD
=======
import 'package:rafiq_app/core/utils/app_images.dart';
>>>>>>> origin/development

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
<<<<<<< HEAD
      context.go(AppRoutes.onBoardScreen);
=======
      context.go(AppRoutes.nearbyHospitalScreen);
>>>>>>> origin/development
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSecondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 120,   backgroundImage: AssetImage("assets/images/logo.png"),backgroundColor: Colors.transparent,),
            Text(
              'Rafiq',
              style: AppTextStyles.font48Regular.copyWith(color:AppColors.onPrimary),
=======
          children: [
            Image.asset(
              AppImages.logo,
              width: 200,
              height: 200,
            ),
            Text(
              'Rafiq',
              style: AppTextStyles.font48Regular.copyWith(
                color: AppColors.onPrimary,
              ),
>>>>>>> origin/development
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/development
