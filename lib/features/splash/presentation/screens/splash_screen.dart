// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushNamed(AppRoutes.onBoardScreen);
    });

    return Scaffold(
      backgroundColor:AppColors.onSecondary,
      body: Center(
        child: Text(
          'Rafiq',
          style: AppTextStyles.font48Regular
        ),
      ),
    );
  }
}