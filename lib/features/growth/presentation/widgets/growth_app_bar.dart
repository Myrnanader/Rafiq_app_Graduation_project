import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class GrowthAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final bool showBackButton;

  const GrowthAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
      child: Row(
        children: [
          /// Back button
          if (showBackButton)
            IconButton(
              onPressed: onBack ?? () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.onPrimaryFixed,
                size: 20.sp,
              ),
            )
          else
            SizedBox(width: 48.w), // يحافظ على التوسيط

          const Spacer(),

          /// Title
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
