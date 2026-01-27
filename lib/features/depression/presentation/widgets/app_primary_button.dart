import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.onPrimary,
          disabledBackgroundColor: AppColors.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
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