import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_icons.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_app_bar.dart';

class GrowthSuccessScreen extends StatelessWidget {
  const GrowthSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              //40.h.verticalSpace,
              // ===== Back =====
              GrowthAppBar(
                title: ' ',
                onBack: () => context.go(AppRoutes.growthTrackerScreen),
              ),
              100.h.verticalSpace,
              // ===== Icon =====
              SvgPicture.asset(AppIcons.verify),
              24.h.verticalSpace,
              SizedBox(
                width: 315.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      'Changes Saved Successfully',
                      style: AppTextStyles.font20Medium.copyWith(
                        color: AppColors.onBackgroundLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    8.h.verticalSpace,
                    Text(
                      'The measurement has been updated and added to the growth chart.',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // ===== Button =====
              AppPrimaryButton(
                text: 'Done',
                onPressed: () {
                  context.go(AppRoutes.growthTrackerScreen);
                },
              ),
              32.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
