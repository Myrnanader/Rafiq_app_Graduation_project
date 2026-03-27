import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';
import '../widgets/cry_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_primary_button.dart';

class CryResultScreen extends StatelessWidget {
  const CryResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = GoRouterState.of(context).extra as CryAnalysisResult?;

    /// safety fallback
    if (result == null) {
      return Scaffold(
        body: Center(
          child: CryPrimaryButton(
            text: 'Go Back',
            onTap: () {
              context.go(AppRoutes.cryAnalysisScreen);
            },
          ),
        ),
      );
    }

    final primary = result.primaryEmotion;
    final primaryPct = result.primaryConfidence;
    final secondary = result.secondaryEmotion;
    final secondaryPct = result.secondaryConfidence;

    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const CryAppBar(title: 'Analysis Result'),

              39.h.verticalSpace,

              const CrySectionHeader(
                title: '',
                subtitle: 'that your baby feel is',
              ),

              70.h.verticalSpace,

              const CryIllustration(),

              24.h.verticalSpace,

              _ResultRow(
                emotion: primary!,
                percentage: primaryPct!,
                isMain: true,
              ),

              if (secondary != null) ...[
                8.h.verticalSpace,
                _ResultRow(
                  emotion: secondary,
                  percentage: secondaryPct!,
                  isMain: false,
                ),
              ],

              const Spacer(),

              CryPrimaryButton(
                text: 'Try Again',
                onTap: () {
                  context.go(AppRoutes.cryAnalysisScreen);
                },
              ),

              119.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  final String emotion;
  final double percentage;
  final bool isMain;

  const _ResultRow({
    required this.emotion,
    required this.percentage,
    required this.isMain,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (percentage * 100).toStringAsFixed(1);

    return Text(
      "$emotion $pct%",
      style: isMain
          ? AppTextStyles.font18SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            )
          : AppTextStyles.font14Medium.copyWith(
              color: AppColors.darkGray,
            ),
      textAlign: TextAlign.center,
    );
  }
}