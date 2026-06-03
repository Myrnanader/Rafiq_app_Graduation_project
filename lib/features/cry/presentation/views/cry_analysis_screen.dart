import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/cry/presentation/cubit/cry_cubit.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_progress_bar.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';

import '../../../delivery/presentation/widgets/delivery_common_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_record_button.dart';

class CryAnalysisScreen extends StatelessWidget {
  final String childId;

  const CryAnalysisScreen({super.key, required this.childId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryCubit, CryState>(
      listener: (context, state) {
        if (state is CrySuccess) {
          context.go(AppRoutes.cryResultScreen, extra: state.result);
        }

        if (state is CryError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isRecording = state is CryRecording;

        final isUploading = state is CryUploading;

        final seconds = state is CryRecording ? state.seconds : 0;

        return Scaffold(
          body: AppGradientBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  30.h.verticalSpace,

                  DeliveryCommonAppBar(
                    title: 'Cry Analysis',
                    onBack: () {
                      context.pop();
                    },
                  ),

                  47.h.verticalSpace,

                  const CrySectionHeader(
                    title: "Analyze baby's cry",
                    subtitle:
                        "We'll help you understand what your baby might need",
                  ),

                  19.h.verticalSpace,

                  const CryIllustration(),

                  const Spacer(),

                  if (isRecording)
                    CryProgressBar(value: (seconds / 30).clamp(0.0, 1.0)),

                  if (isRecording)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text("$seconds sec"),
                    ),

                  if (isUploading) const CircularProgressIndicator(),

                  20.h.verticalSpace,

                  CryRecordButton(
                    isRecording: isRecording,
                    onTap: () {
                      if (isRecording) {
                        context.read<CryCubit>().stopAndAnalyze(
                          childId: childId,
                        );
                      } else {
                        context.read<CryCubit>().startRecording();
                      }
                    },
                  ),

                  20.h.verticalSpace,

                  Text(
                    isRecording ? "Tap again to stop" : "Tap to analyze",
                    style: AppTextStyles.font14Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),

                  82.h.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
