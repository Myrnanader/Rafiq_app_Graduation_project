import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class OnboardingProgressArrow extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const OnboardingProgressArrow({
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / totalPages;

    return GestureDetector(
      onTap: onNext,
      child: SizedBox(
        width: 60.w,
        height: 60.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Progress circle
            SizedBox(
              width: 58.w,
              height: 58.w,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 3.w,
                backgroundColor:AppColors.onSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            // Inner button
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}