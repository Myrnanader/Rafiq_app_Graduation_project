import 'package:flutter/material.dart';

import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';

class TabButton extends StatelessWidget {
  final String text;
  final bool active;

  const TabButton({
    super.key,
    required this.text,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.veryLightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: AppTextStyles.font13Regular.copyWith(
          color: active ? AppColors.lightBackground : AppColors.primary,
        ),
      ),
    );
  }
}
