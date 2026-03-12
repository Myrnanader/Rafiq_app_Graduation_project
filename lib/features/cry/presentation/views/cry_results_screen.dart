import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';
import '../widgets/cry_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_primary_button.dart';

class CryResultScreen extends StatelessWidget {
  const CryResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const CryAppBar(title: 'Analysis Result'),
              39.h.verticalSpace,
              const CrySectionHeader(
                title: ' ',
                subtitle: 'that your baby feel is',
              ),
              70.h.verticalSpace,
              const CryIllustration(),
              //47.h.verticalSpace,
              const CrySectionHeader(
                title: 'Angry 81.3%  ',
                subtitle: 'Sleepy 18.7% ',
              ),
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