import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DeliveryCommonAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const DeliveryCommonAppBar({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 18.h),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.onPrimaryFixed,
              size: 20.sp,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: AppTextStyles.font20SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}