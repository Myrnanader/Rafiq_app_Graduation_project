import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_intro_text.dart';
import '../widgets/delivery_common_app_bar.dart';

class DeliveryStartScreen extends StatelessWidget {
  const DeliveryStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              30.h.verticalSpace,
              DeliveryCommonAppBar(
                title: 'Initial Delivery Prediction',
                onBack: () => context.pop(),
              ),

              47.h.verticalSpace,

              const DeliveryIntroText(),

              48.h.verticalSpace,

              Image.asset(AppImages.motherAndBaby, height: 307.h, width:244.w),

              const Spacer(),

              AppPrimaryButton(
                text: 'Start',
                onPressed: () {
                  context.go(AppRoutes.deliverySurveyScreen);
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
