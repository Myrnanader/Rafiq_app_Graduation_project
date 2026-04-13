
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';

class ChildCard extends StatelessWidget {
  final ChildResponse child;
  final VoidCallback onTap;

  const ChildCard({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy')
        .format(DateTime.parse(child.dateOfBirth));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.onSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              child.nickname,
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            8.h.verticalSpace,
            Text(
              formattedDate,
              style: AppTextStyles.font13Regular.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}