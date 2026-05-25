// onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:124.h,right:24.w,left:24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 280.h),
          16.ph,
          Text(
            title,
            style: AppTextStyles.font22SemiBold.copyWith(color: AppColors.onSurfaceLight),
            textAlign: TextAlign.start,
          ),
          4.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              description,
              style:  AppTextStyles.font16light.copyWith(color: AppColors.darkGray),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}