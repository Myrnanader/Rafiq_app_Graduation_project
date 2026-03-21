import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class BabyInfoCard extends StatelessWidget {
  const BabyInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            
            Image.asset(AppImages.growthBaby, width: 120.w, fit: BoxFit.cover),

            
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Baby info',
                      style: AppTextStyles.font18Medium.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    8.h.verticalSpace,

                    _infoRow('Name:', 'Faya Nader'),
                    6.h.verticalSpace,
                    _infoRow('Birthday:', '20 Apr 2024'),
                    6.h.verticalSpace,
                    _infoRow('Age:', '2'),
                    6.h.verticalSpace,
                    _infoRow('Gender:', 'Female'),
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
