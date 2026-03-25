import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/storage/shared_prefs_service.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final fullName = SharedPrefsService.getFullName();

    final firstName = (fullName != null && fullName.trim().isNotEmpty)
        ? fullName.split(" ").first
        : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/memory.png"),
            ),
            const SizedBox(width: 10),
            Text(
              firstName != null ? "Hello, $firstName" : "Welcome 👋",
              style: AppTextStyles.font12Medium,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.push(AppRoutes.notificationScreen),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              'assets/icons/notifications.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
