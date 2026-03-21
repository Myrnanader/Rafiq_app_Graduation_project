import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/core/common/widgets/app_secondary_button.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_step_one.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_step_three.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_step_two.dart';

import '../widgets/delivery_progress_bar.dart';

class DeliverySurveyScreen extends StatefulWidget {
  const DeliverySurveyScreen({super.key});

  @override
  State<DeliverySurveyScreen> createState() => _DeliverySurveyScreenState();
}

class _DeliverySurveyScreenState extends State<DeliverySurveyScreen> {
  int step = 0;
  final int totalQuestions = 12;

  final List<int> _progressMap = [4, 8, 12];

  int get currentProgress => _progressMap[step];

  void next() {
    if (step < 2) {
      setState(() => step++);
    } else {
      context.go(AppRoutes.deliveryResultScreen);
    }
  }

  void back() {
    if (step > 0) {
      setState(() => step--);
    } else {
      context.go(AppRoutes.deliveryStartScreen);
    }
  }

  Widget _buildStep() {
    switch (step) {
      case 0:
        return const DeliveryStepOne();
      case 1:
        return const DeliveryStepTwo();
      case 2:
        return const DeliveryStepThree();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              30.h.verticalSpace,
              /// AppBar
              DeliveryAppBar(
                current: currentProgress,
                total: totalQuestions,
                onBack: back,
              ),

              /// Progress bar
              DeliveryProgressBar(
                current: currentProgress,
                total: totalQuestions,
              ),

            //32.h.verticalSpace,

              /// Questions
              Expanded(child: SingleChildScrollView(child: _buildStep())),

              /// Buttons
              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(text: 'Back', onPressed: back),
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: AppPrimaryButton(
                      text: step == 2 ? 'Finish' : 'Next',
                      onPressed: next,
                    ),
                  ),
                ],
              ),

              96.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
