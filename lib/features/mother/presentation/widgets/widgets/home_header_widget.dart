import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../auth/presentation/cubit/user_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        String? firstName;

        if (state is UserLoaded) {
          final fullName = state.profile.fullName;

          if (fullName != null && fullName.trim().isNotEmpty) {
            firstName = fullName.split(" ").first;
          }
        }

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
      },
    );
  }
}