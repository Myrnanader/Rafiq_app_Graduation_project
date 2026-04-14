/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class GrowthSummaryCard extends StatelessWidget {
  const GrowthSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.onSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ===== Header =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Growth Recorder',
                style: AppTextStyles.font18Medium.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.go(AppRoutes.addGrowthScreen);
                },
                child: Text(
                  'Add +',
                  style: AppTextStyles.font13Regular.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          ),

          8.h.verticalSpace,

          /// ===== Data =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _item(value: '10.50', unit: 'kg', date: 'Sun, 20 Apr 2024'),
              _item(value: '75', unit: 'cm', date: 'Sun, 20 Apr 2024'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String value,
    required String unit,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// الرقم + الوحدة inline
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: AppTextStyles.font24Bold.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
              TextSpan(
                text: ' $unit',
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
            ],
          ),
        ),

        8.h.verticalSpace,

        Text(
          date,
          style: AppTextStyles.font14Regular.copyWith(
            color: AppColors.onPrimary,
          ),
        ),
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/data/models/growth_record_response.dart';

class GrowthSummaryCard extends StatelessWidget {
  final GrowthRecordResponse record;

  const GrowthSummaryCard({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {

    ///  حماية من أي null أو crash
    final weight = record.weightKg;
    final height = record.heightCm;
    final date = record.measurementDate;

    final formattedDate = DateFormat('EEE, dd MMM yyyy').format(date);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.onSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Growth Recorder',
                style: AppTextStyles.font18Medium.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.go(
                    AppRoutes.addGrowthScreen,
                    extra: record.childId,
                  );
                },
                child: Text(
                  'Add +',
                  style: AppTextStyles.font13Regular.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          ),

          8.h.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _item(
                value: weight.toString(),
                unit: 'kg',
                date: formattedDate,
              ),
              _item(
                value: height.toString(),
                unit: 'cm',
                date: formattedDate,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String value,
    required String unit,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: AppTextStyles.font24Bold.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
              TextSpan(
                text: ' $unit',
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
            ],
          ),
        ),
        8.h.verticalSpace,
        Text(
          date,
          style: AppTextStyles.font14Regular.copyWith(
            color: AppColors.onPrimary,
          ),
        ),
      ],
    );
  }
}