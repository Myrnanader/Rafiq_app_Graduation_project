import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DepressionScoreIndicator extends StatelessWidget {
  final double value; // من 0.0 إلى 1.0
  final int score;

  const DepressionScoreIndicator({
    super.key,
    required this.value,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144.w,
      height: 144.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// الخلفية
          SizedBox(
            width: 144.w,
            height: 144.w,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 8,
              color: AppColors.lightScaffoldBackgroundColor,
            ),
          ),

          /// الـ progress
          SizedBox(
            width: 144.w,
            height: 144.w,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 8,
              color: AppColors.onPrimary,
              strokeCap: StrokeCap.round,
            ),
          ),

          /// النص في
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score',
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
              4.h.verticalSpace,
              Text(
                score.toString(),
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}