import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';

class ChildCard extends StatelessWidget {
  final ChildResponse child;
  final VoidCallback onTap;

  const ChildCard({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ///  Safe date parsing
    String formattedDate = "";

    try {
      formattedDate = DateFormat('dd MMM yyyy')
          .format(DateTime.parse(child.dateOfBirth));
    } catch (e) {
      formattedDate = child.dateOfBirth;
    }

    ///  تحديد اللون حسب gender
    Color iconColor;
    Color bgColor;

    if (child.gender == 0) {
      ///  Male
      iconColor = Colors.blue;
      bgColor = Colors.blue.withValues(alpha:0.1);
    } else if (child.gender == 1) {
      ///  Female
      iconColor = Colors.pink;
      bgColor = Colors.pink.withValues(alpha:0.1);
    } else {
      ///  fallback
      iconColor = AppColors.primary;
      bgColor = AppColors.primary.withValues(alpha:0.1);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///  Left (Text)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  child.nickname,
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  formattedDate,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
            ///  Right (Icon)
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.child_care,
                color: iconColor,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}