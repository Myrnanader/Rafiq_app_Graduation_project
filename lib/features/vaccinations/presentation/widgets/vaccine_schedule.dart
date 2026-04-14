import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class VaccineSchedule extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String subtitle;
  final bool isLast;

  const VaccineSchedule({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$stepNumber',
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.lightBackground,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 1, color: AppColors.primary)),
            ],
          ),
          15.pw,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  2.ph,
                  Text(
                    subtitle,
                    style: AppTextStyles.font13Medium.copyWith(
                      color: AppColors.darkGray,
                    ),                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
