import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import '../widgets/depression_common_app_bar.dart';
import '../../../../core/common/widgets/app_primary_button.dart';

class DepressionStartScreen extends StatelessWidget {
  const DepressionStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              DepressionCommonAppBar(
                title: "Let's Start Survey",
                onBack: () => context.push(
                  AppRoutes.mainNavigationBarScreen,
                ),
              ),

              47.h.verticalSpace,

              Text(
                'This short survey helps identify early signs of postpartum depression, making sure you get the right support at the right time.',
                textAlign: TextAlign.center,
                style: AppTextStyles.font13Regular.copyWith(
                  color: AppColors.darkGray,
                ),
              ),

              54.h.verticalSpace,

              Image.asset(
                AppImages.survey,
                width: 270.w,
                height: 277.h,
                fit: BoxFit.contain,
              ),

              const Spacer(),

              AppPrimaryButton(
                text: 'Start',
                onPressed: () {
                  context.go(AppRoutes.depressionSurveyScreen);
                },
              ),

              96.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}