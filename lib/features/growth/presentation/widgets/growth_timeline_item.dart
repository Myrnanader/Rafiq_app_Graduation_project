import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class GrowthTimelineItem extends StatelessWidget {
  final String title;
  final String author;
  final String weight;
  final String height;
  final String date;
  final String time;
  final bool isLast;

  const GrowthTimelineItem({
    super.key,
    required this.title,
    required this.author,
    required this.weight,
    required this.height,
    required this.date,
    required this.time,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Timeline Column =====
          Column(
            children: [
              //_dashedLine(height: 20.h),

              //image circle
              Container(
                width: 35.w,
                height: 35.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.onPrimary,
                ),
                child: Image.asset(AppImages.growthCursor),
              ),

              if (!isLast) _dashedLine(height: 60.h),
            ],
          ),

          8.w.horizontalSpace,

          /// ===== Content =====
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Left
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.font14SemiBold.copyWith(
                          color: AppColors.onBackgroundLight,
                        ),
                      ),
                      6.h.verticalSpace,
                      Text(
                        'By $author',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                      6.h.verticalSpace,
                      Text(
                        'Weight $weight',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                      4.h.verticalSpace,
                      Text(
                        'Height $height',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Right
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    4.h.verticalSpace,
                    Text(
                      time,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ===== dashed vertical line  =====
  Widget _dashedLine({required double height}) {
    return SizedBox(
      width: 4.w,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (height / 16).floor(),
          (_) => Container(
            width: 1.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ),
      ),
    );
  }
}
