import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DeliveryIntroText extends StatelessWidget {
  const DeliveryIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please answer a few questions so we can \n'
      'give you an early indication of your \n'
      'expected delivery type',
      textAlign: TextAlign.center,
      style: AppTextStyles.font13Regular.copyWith(
        color: AppColors.darkGray,
        height: 1.4,
      ),
    );
  }
}