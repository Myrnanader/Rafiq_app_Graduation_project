import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';



class CryAppBar extends StatelessWidget {
  final String title;
  const CryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 56.h, bottom: 24.h),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: AppColors.onPrimaryFixed,
            size: 20.sp,
          ),
          const Spacer(),
          Text(
            title,
            style: AppTextStyles.font20medium.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}