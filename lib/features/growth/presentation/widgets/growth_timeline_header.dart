import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class GrowthTimelineHeader extends StatelessWidget {
  const GrowthTimelineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Text(
        'Timeline',
        style: AppTextStyles.font16Medium.copyWith(color: AppColors.onPrimary),
      ),
    );
  }
}
