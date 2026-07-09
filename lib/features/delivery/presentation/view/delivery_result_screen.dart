import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../data/models/delivery_prediction_response.dart';
import '../widgets/delivery_common_app_bar.dart';

class DeliveryResultScreen extends StatelessWidget {

  final DeliveryPredictionResponse? response;

  const DeliveryResultScreen({super.key, this.response});

  String get _title {
    if (response == null) {
      return 'No prediction available';
    }
    return response!.isCSection
        ? 'Your delivery is likely to be a C-section'
        : 'Your delivery is likely to be Normal';
  }

  @override
  Widget build(BuildContext context) {
    final confidence = response!.isCSection
        ? response!.cSectionProbability
        : 1 - response!.cSectionProbability;

    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              30.h.verticalSpace,
              DeliveryCommonAppBar(
                title: 'Delivery Results',
                onBack: () => context.go(AppRoutes.dashboardScreen),
              ),

              83.h.verticalSpace,

              Image.asset(
                'assets/images/mini_baby.png',
                width: 142.w,
                height: 193.h,
                fit: BoxFit.contain,
              ),
              24.h.verticalSpace,

              Text(
                _title,
                textAlign: TextAlign.center,
                style: AppTextStyles.font16SemiBold,
              ),

              12.h.verticalSpace,

              Text(
                'This is an initial prediction based on  \n'
                    'the data you provided \n',
                textAlign: TextAlign.center,
                style: AppTextStyles.font13Regular.copyWith(
                  color: AppColors.darkGray,
                  height: 1.4,
                ),
              ),

              if (response != null) ...[
                8.h.verticalSpace,
                Text(
                  'Confidence: ${(confidence * 100).toStringAsFixed(0)}%',
                  style: AppTextStyles.font13Regular.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],

              const Spacer(),

              AppPrimaryButton(
                text: 'Back to Dashboard',
                onPressed: () {
                  context.go(AppRoutes.mainNavigationBarScreen);
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