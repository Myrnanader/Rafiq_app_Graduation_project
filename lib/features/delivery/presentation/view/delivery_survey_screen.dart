import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/delivery/presentation/widgets/delivery_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/api/delivery_prediction_api_service.dart';
import '../../data/repository/delivery_prediction_repository.dart';
import '../cubit/delivery_prediction_cubit.dart';
import '../cubit/delivery_prediction_state.dart';
import '../widgets/delivery_step_one.dart';
import '../widgets/delivery_step_three.dart';
import '../widgets/delivery_step_two.dart';

import '../widgets/delivery_progress_bar.dart';

class DeliverySurveyScreen extends StatelessWidget {
  const DeliverySurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeliveryPredictionCubit(
        repository: DeliveryPredictionRepository(
          apiService: DeliveryPredictionApiService(
            Dio(
              BaseOptions(
                baseUrl: 'https://rafiq-production-a90b7.up.railway.app/',
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
              ),
            ),
          ),
        ),
      ),
      child: const _DeliverySurveyView(),
    );
  }
}

class _DeliverySurveyView extends StatefulWidget {
  const _DeliverySurveyView();

  @override
  State<_DeliverySurveyView> createState() => _DeliverySurveyViewState();
}

class _DeliverySurveyViewState extends State<_DeliverySurveyView> {
  int step = 0;
  final int totalQuestions = 12;

  final List<int> _progressMap = [4, 8, 12];

  int get currentProgress => _progressMap[step];

  void back() {
    if (step > 0) {
      setState(() => step--);
    } else {
      context.go(AppRoutes.deliveryStartScreen);
    }
  }

  void _onPrimaryPressed(DeliveryPredictionCubit cubit) {
    if (!cubit.isStepComplete(step)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.lightPurple,
          content: Text('Please answer all questions' ,style: TextStyle(color: AppColors.darkGray),),
        ),
      );
      return;
    }

    if (step < 2) {
      setState(() => step++);
    } else {
      cubit.predict();
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
    return BlocConsumer<DeliveryPredictionCubit, DeliveryPredictionState>(
      listener: (context, state) {
        if (state is DeliveryPredictionSuccess) {
          context.go(AppRoutes.deliveryResultScreen, extra: state.response);
        } else if (state is DeliveryPredictionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<DeliveryPredictionCubit>();
        final isLoading = state is DeliveryPredictionLoading;

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

                  /// Questions
                  Expanded(
                    child: SingleChildScrollView(child: _buildStep()),
                  ),

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: isLoading ? null : back,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.onPrimary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              'Back',
                              style: AppTextStyles.font16Medium.copyWith(
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      16.w.horizontalSpace,
                      Expanded(
                        child: AppPrimaryButton(
                          text: isLoading
                              ? 'Loading...'
                              : (step == 2 ? 'Finish' : 'Next'),
                          onPressed: isLoading
                              ? null
                              : () => _onPrimaryPressed(cubit),
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
      },
    );
  }
}