import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/storage/secure_storage_service.dart';
import 'package:rafiq_app/core/storage/shared_prefs_service.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();

    _initNavigation();
  }

  Future<void> _initNavigation() async {
    final secureStorage = getIt<SecureStorageService>();
    final hasToken = await secureStorage.hasValidToken();
    final isFirstTime = SharedPrefsService.isFirstTime();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (hasToken) {
      context.go(AppRoutes.mainNavigationBarScreen);
    } else if (isFirstTime) {
      context.go(AppRoutes.onBoardScreen);
    } else {
      context.go(AppRoutes.signInScreen);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSecondary,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: scaleAnimation.value,
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Image.asset(AppImages.logo, width: 200, height: 200),
                  ),
                ),
                const SizedBox(height: 20),
                Opacity(
                  opacity: opacityAnimation.value,
                  child: Text(
                    'Rafiq',
                    style: AppTextStyles.font48Regular.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
