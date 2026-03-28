import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../auth/presentation/cubit/user_cubit.dart';

class BabyProgress extends StatelessWidget {
  const BabyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        int? currentWeek;

        ///  جيب الweek من API
        if (state is UserLoaded) {
          currentWeek = state.profile.pregnancyWeek;
        }

        /// لو مفيش بيانات
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
      },
    );
  }
}