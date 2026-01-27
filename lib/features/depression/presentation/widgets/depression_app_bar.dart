import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DepressionAppBar extends StatelessWidget {
  final int current;
  final int total;
  final VoidCallback onBack;

  const DepressionAppBar({
    super.key,
    required this.current,
    required this.total,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 18.h),
      child: Row(
        children: [
          /// Back icon (aligned مع padding الصفحة)
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

          /// 1/9
          Text(
            '$current/$total',
            style: AppTextStyles.font16SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
        ],
      ),
    );
  }
}