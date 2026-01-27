import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DepressionProgressBar extends StatelessWidget {
  final int current;
  final int total;

  const DepressionProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: current / total,
      minHeight: 6.h,
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      color: AppColors.onPrimary,
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}