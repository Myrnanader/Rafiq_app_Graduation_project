
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';

class BabyInfoCard extends StatelessWidget {
  final ChildResponse child;

  const BabyInfoCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final birthDate = DateTime.parse(child.dateOfBirth);

    final formattedDate =
        DateFormat('dd MMM yyyy').format(birthDate);

    final ageInMonths =
        DateTime.now().difference(birthDate).inDays ~/ 30;

    final genderText = child.gender == 0 ? 'Male' : 'Female';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppImages.growthBaby,
              width: 120.w,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Baby info',
                      style: AppTextStyles.font18Medium.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    8.h.verticalSpace,

                    _infoRow('Name:', child.nickname),
                    6.h.verticalSpace,
                    _infoRow('Birthday:', formattedDate),
                    6.h.verticalSpace,
                    _infoRow('Age:', '$ageInMonths months'),
                    6.h.verticalSpace,
                    _infoRow('Gender:', genderText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 70.w,
          child: Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: AppColors.lightAppColors,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.font12SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
        ),
      ],
    );
  }
}