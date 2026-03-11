import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign in',
          style: AppTextStyles.font24SemiBold.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),
        8.h.ph,
        Text(
          'Hello, there!',
          style: AppTextStyles.font14Medium.copyWith(
            color: AppColors.lightAppColors,
          ),
        ),
      ],
    );
  }
}