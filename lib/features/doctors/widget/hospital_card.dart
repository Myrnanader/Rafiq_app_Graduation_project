import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/doctors/models/hospital_model.dart';

class HospitalCard extends StatelessWidget {
  final HospitalModel hospital;
  final VoidCallback onTap;

  const HospitalCard({
    super.key,
    required this.hospital,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.onPrimary.withValues(alpha: .25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Category pill
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                hospital.category,
                style: AppTextStyles.font12Regular.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            8.h.verticalSpace,

            Text(
              hospital.name,
              style: AppTextStyles.font14SemiBold,
            ),

            4.h.verticalSpace,

            Text(
              hospital.distance,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.darkGray,
              ),
            ),

            8.h.verticalSpace,

            Row(
              children: [
                Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                6.w.horizontalSpace,
                Text(
                  '${hospital.doctorsCount} Doctors obstetricians available now',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.darkGray,
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
