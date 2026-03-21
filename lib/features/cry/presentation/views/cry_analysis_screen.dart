import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';
import '../../../delivery/presentation/widgets/delivery_common_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_record_button.dart';

class CryAnalysisScreen extends StatelessWidget {
  const CryAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              // const CryAppBar(title: 'Cry Analysis'),
              // 47.h.verticalSpace,
              30.h.verticalSpace,
              DeliveryCommonAppBar(
                title: 'Cry Analysis',
                onBack: () => context.pop(),
              ),

              47.h.verticalSpace,
              const CrySectionHeader(
                title: 'Analyze baby’s cry',
                subtitle: 'We’ll help you understand what your baby might need',
              ),
              19.h.verticalSpace,
              const CryIllustration(),
              const Spacer(),
              CryRecordButton(
                onTap: () {
                  context.go(AppRoutes.cryProgressScreen);
                },
              ),
              20.h.verticalSpace,
              Text('Tap to analyze', style: AppTextStyles.font14Medium.copyWith(
                color: AppColors.onPrimaryFixed,
              ),),
              82.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
