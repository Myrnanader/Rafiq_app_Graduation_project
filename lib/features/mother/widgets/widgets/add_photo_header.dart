import 'package:flutter/material.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import 'custom_tab_button.dart';

class AddPhotoHeader extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onAddPressed;

  const AddPhotoHeader({
    super.key,
    required this.selectedCount,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cancel",
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.primary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.veryLightGray,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.lavender, width: 1),
            ),
            child: Row(
              children: [
                TabButton(text: "Photo", active: true),
                TabButton(text: "Albums", active: false),
              ],
            ),
          ),
          TextButton(
            onPressed: onAddPressed,
            child: Text(
              "Add ($selectedCount)",
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.lavender,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
