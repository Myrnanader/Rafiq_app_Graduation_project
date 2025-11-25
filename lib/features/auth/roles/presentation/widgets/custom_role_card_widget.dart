import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';

class IconTextCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  const IconTextCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 156.w,
        height: 164.h,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.darkGray.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 56.w,
              height: 56.h,
              fit: BoxFit.contain,
            ),
            3.h.ph,
            Text(
              label,
              style: AppTextStyles.font18SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}