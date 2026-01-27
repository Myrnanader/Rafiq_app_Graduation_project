import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';

class DepressionSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const DepressionSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.font18SemiBold),
        8.h.verticalSpace,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.font13Regular,
        ),
      ],
    );
  }
}