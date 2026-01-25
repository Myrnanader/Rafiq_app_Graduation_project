import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CrySectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CrySectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.font18SemiBold,
        ),
        8.h.verticalSpace,
        SizedBox(
          width:241.w,
          height: 36,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.darkGray,
            ),
          ),
        ),
      ],
    );
  }
}