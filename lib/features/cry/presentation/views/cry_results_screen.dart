import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';
import '../widgets/cry_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_primary_button.dart';
import '../widgets/cry_section_header.dart';

class CryResultScreen extends StatelessWidget {
  final CryAnalysisResult result;

  const CryResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const CryAppBar(
                  title: 'Analysis Result',
                ),

                30.h.verticalSpace,

                const CrySectionHeader(
                  title: 'Cry Analysis',
                  subtitle: 'Analysis completed successfully',
                ),

                40.h.verticalSpace,

                const CryIllustration(),

                32.h.verticalSpace,

                Text(
                  result.cryDetected
                      ? "Cry detected: Yes"
                      : "Cry detected: No",
                ),

                16.h.verticalSpace,

                if (result.cryDetected)
                  Text(
                    "Cry type: ${result.cryType ?? 'Unknown'}",
                  )
                else
                  const Text(
                    "No cry pattern detected in this recording.",
                  ),

                16.h.verticalSpace,

                CryPrimaryButton(
                  text: 'Analyze Again',
                  onTap: () {
                    context.go(
                      AppRoutes.selectCryChildScreen,
                    );
                  },
                ),

                40.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}