import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingIndicator({
    required this.controller,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 217.h,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller,
          count: count,
          effect: ExpandingDotsEffect(
            dotHeight: 8.h,
            dotWidth: 8.h,
            expansionFactor: 3,
            spacing: 4.w,
            activeDotColor: AppColors.onPrimary,
            dotColor: AppColors.onSecondary,
          ),
        ),
      ),
    );
  }
}