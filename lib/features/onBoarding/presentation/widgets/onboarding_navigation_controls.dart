import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_progress_arrow.dart';

class OnboardingNavigationControls extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;

  const OnboardingNavigationControls({
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
    required this.onSkip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 74.h,
          left: 24.w,
          child: TextButton(
            onPressed: onSkip,
            child: Text(
              "Skip",
              style: AppTextStyles.font14SemiBold.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ),
        if (currentIndex > 0)
          Positioned(
            top: 50.h,
            left: 24.w,
            child: GestureDetector(
              onTap: onPrevious,
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.darkSurface,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        Positioned(
          bottom: 74.h,
          right: 24.w,
          child: OnboardingProgressArrow(
            currentIndex: currentIndex,
            totalPages: totalPages,
            onNext: onNext,
          ),
        ),
      ],
    );
  }
}