import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/cry/presentation/cubit/cry_cubit.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_primary_button.dart';
import '../widgets/cry_progress_bar.dart';

class CryProgressScreen extends StatelessWidget {
  const CryProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryCubit, CryState>(
      listener: (context, state) {
        if (state is CrySuccess) {
          context.go(
            AppRoutes.cryResultScreen,
            extra: state.result,
          );
        }

        if (state is CryError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
          context.go(AppRoutes.cryAnalysisScreen);
        }

        if (state is CryInitial) {
          context.go(AppRoutes.cryAnalysisScreen);
        }
      },
      builder: (context, state) {
        final isUploading = state is CryUploading;
        final seconds = state is CryRecording ? state.seconds : 0;

        /// progress max 30 sec
        final double progressValue =
            state is CryRecording ? (seconds / 30.0).clamp(0.0, 1.0) : 0.0;

        final String timeDisplay =
            "${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}";

        return Scaffold(
          body: AppGradientBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  163.h.verticalSpace,

                  CrySectionHeader(
                    title: isUploading
                        ? 'Analyzing...'
                        : 'Analyze cry pattern',
                    subtitle:
                        "We'll help you understand what your baby might need",
                  ),

                  19.h.verticalSpace,

                  const CryIllustration(),

                  const Spacer(),

                  /// Progress
                  if (isUploading)
                    const LinearProgressIndicator()
                  else
                    CryProgressBar(value: progressValue),

                  11.h.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isUploading ? 'Uploading...' : 'Recording',
                        style: AppTextStyles.font14Medium,
                      ),
                      if (!isUploading)
                        Text(
                          timeDisplay,
                          style: AppTextStyles.font14Medium.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                    ],
                  ),

                  24.h.verticalSpace,

                  /// Stop button
                  if (!isUploading)
                    CryPrimaryButton(
                      text: 'Stop & Analyze',
                      onTap: () {
                        context.read<CryCubit>().stopAndAnalyze();
                      },
                    ),

                  if (isUploading)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: CircularProgressIndicator(),
                    ),

                  87.h.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}