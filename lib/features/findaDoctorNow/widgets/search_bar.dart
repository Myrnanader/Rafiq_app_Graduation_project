import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';


class HospitalSearchBar extends StatelessWidget {
  const HospitalSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for a nearby hospital',
        hintStyle: AppTextStyles.font12Regular.copyWith(
          color: AppColors.neutralGray,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.neutralGray,
          size: 26.sp,
        ),
        filled: true,
        fillColor: Colors.transparent,
        // fillColor: Colors.white.withValues(alpha: 0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.onPrimary.withValues(alpha: .25),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.onPrimary.withValues(alpha: .25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
