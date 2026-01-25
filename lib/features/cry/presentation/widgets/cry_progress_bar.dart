import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CryProgressBar extends StatelessWidget {
  final double value;
  const CryProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      minHeight: 6.h,
      backgroundColor: AppColors.onSecondary,
      color: AppColors.onPrimary,
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}