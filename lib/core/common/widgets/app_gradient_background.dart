import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;

  const AppGradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.onSecondary,
            AppColors.lightBackground,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}