import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/storage/shared_prefs_service.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class BabyProgress extends StatelessWidget {
  const BabyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final int? currentWeek = SharedPrefsService.getPregnancyWeek();

    /// لو مفيش بيانات → منعرضش widget
    if (currentWeek == null || currentWeek == 0) {
      return const SizedBox();
    }

    const int totalWeeks = 40;

    final double progress = currentWeek / totalWeeks;

    final int weeksLeft = totalWeeks - currentWeek;
    final int daysLeft = weeksLeft * 7;

    return Column(
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 7,
                  backgroundColor: AppColors.lightBackground,
                  valueColor:
                      const AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/baby.svg',
                  width: 77.19,
                  height: 84.92,
                ),
              ),
            ],
          ),
        ),
        10.ph,
        Text(
          "$daysLeft days left",
          style: AppTextStyles.font14Regular.copyWith(
            color: AppColors.neutralGray,
          ),
        ),
      ],
    );
  }
}