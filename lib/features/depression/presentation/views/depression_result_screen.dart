/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import '../widgets/depression_common_app_bar.dart';
import '../widgets/depression_score_indicator.dart';
import '../../../../core/common/widgets/app_primary_button.dart';

class DepressionResultScreen extends StatelessWidget {
  const DepressionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DepressionCommonAppBar(
                title: 'Survey Results',
                onBack: () => context.go(AppRoutes.depressionSurveyScreen),
              ),

              96.h.verticalSpace,

              const Center(
                child: DepressionScoreIndicator(value: 0.6, score: 15),
              ),
              40.h.verticalSpace,
              Text(
                'Your result indicates moderately severe depression. '
                'This level usually requires active treatment, such as '
                'medication, psychotherapy, or a combination of both.',
                style: AppTextStyles.font13Regular.copyWith(height: 1.6),
              ),  

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
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/depression/presentation/utils/risk_level_mapper.dart';
import '../widgets/depression_common_app_bar.dart';
import '../widgets/depression_score_indicator.dart';
import '../../../../core/common/widgets/app_primary_button.dart';

class DepressionResultScreen extends StatelessWidget {
  const DepressionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map?;
    final score = data?["score"] ?? 0;
    final risk = data?["risk"] ?? "Low";

    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DepressionCommonAppBar(
                title: 'Survey Results',
                onBack: () =>
                    context.go(AppRoutes.depressionSurveyScreen),
              ),
              96.h.verticalSpace,
              Center(
                child: DepressionScoreIndicator(
                  value: score / 30,
                  score: score,
                ),
              ),
              40.h.verticalSpace,
              Text(
                getRiskDescription(risk),
                style:
                    AppTextStyles.font14Medium.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
              ),
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