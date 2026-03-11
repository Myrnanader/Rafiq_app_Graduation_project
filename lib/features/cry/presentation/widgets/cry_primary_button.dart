import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';

class CryPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CryPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.onPrimary,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTextStyles.font16Medium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}