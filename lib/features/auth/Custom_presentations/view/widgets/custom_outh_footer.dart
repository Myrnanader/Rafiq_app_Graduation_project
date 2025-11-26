import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomAuthFooter extends StatelessWidget {
  final String questionText;   //
  final String actionText;   
  final String route;        

  const CustomAuthFooter({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: AppTextStyles.font13Regular.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),
        TextButton(
          onPressed: () {
            context.go(route);
          },
          child: Text(
            actionText,
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}