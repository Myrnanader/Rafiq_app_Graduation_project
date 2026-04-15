import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final bool isLoading;
  final bool autoClose;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.isLoading = false,
    this.autoClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.lightBackground,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🔹 TITLE
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 CONTENT
            Text(
              content,
              textAlign: TextAlign.center,
              style: AppTextStyles.font13Regular.copyWith(
                color: AppColors.darkGray,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            /// 🔹 BUTTONS
            Row(
              children: [
                /// ❌ NO (Cancel)
                Expanded(
                  child: OutlinedButton(
                    onPressed: isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'No',
                      style: AppTextStyles.font14Medium.copyWith(
                        color: AppColors.lightBackground,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// ✅ YES (Confirm)
                Expanded(
                  child: OutlinedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (autoClose) {
                              Navigator.of(context).pop();
                            }
                            onConfirm();
                          },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'Yes',
                            style: AppTextStyles.font14Medium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
