import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class VaccineDetailsInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const VaccineDetailsInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.lightBackground, size: 24),
          ),
          15.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.font13Medium.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                2.ph,
                Text(
                  subtitle,
                  style: AppTextStyles.font13Medium.copyWith(
                    color: AppColors.onPrimaryFixed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
