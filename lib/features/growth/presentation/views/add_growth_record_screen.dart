
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import 'package:rafiq_app/features/growth/presentation/widgets/growth_app_bar.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_date_picker_field.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_glass_text_field.dart';

import '../../data/models/growth_record_request.dart';
import '../cubit/growth_cubit.dart';
import '../cubit/growth_state.dart';

class AddGrowthRecordScreen extends StatefulWidget {
  final String childId;

  const AddGrowthRecordScreen({
    super.key,
    required this.childId,
  });

  @override
  State<AddGrowthRecordScreen> createState() =>
      _AddGrowthRecordScreenState();
}

class _AddGrowthRecordScreenState extends State<AddGrowthRecordScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  DateTime? selectedDate;

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GrowthCubit>(),
      child: BlocConsumer<GrowthCubit, GrowthState>(
        listener: (context, state) {
          if (state is GrowthAddSuccess) {
            ///  نروح للـ success screen
            context.go(AppRoutes.growthSuccessScreen,
                extra: state.childId);
          } else if (state is GrowthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: AppGradientBackground(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      GrowthAppBar(
                        title: 'Add Growth Record',
                        onBack: () => context.go(
                          AppRoutes.growthTrackerScreen,
                          extra: widget.childId,
                        ),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Track your baby's growth journey",
                                  style:
                                      AppTextStyles.font14Regular.copyWith(
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ),
                              48.h.verticalSpace,

                              Text('Weight',
                                  style: AppTextStyles.font16Medium),
                              8.h.verticalSpace,
                              GrowthGlassTextField(
                                hintText: '0.0',
                                suffixText: 'Kg',
                                keyboardType: TextInputType.number,
                                controller: weightController,
                              ),

                              20.h.verticalSpace,

                              Text('Height',
                                  style: AppTextStyles.font16Medium),
                              8.h.verticalSpace,
                              GrowthGlassTextField(
                                hintText: '0.0',
                                suffixText: 'cm',
                                keyboardType: TextInputType.number,
                                controller: heightController,
                              ),

                              20.h.verticalSpace,

                              Text('Measurement Date',
                                  style: AppTextStyles.font16Medium),
                              8.h.verticalSpace,
                              GrowthDatePickerField(
                                onDateSelected: (date) {
                                  selectedDate = date;
                                },
                              ),

                              120.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),

                      AppPrimaryButton(
                        text: state is GrowthLoading
                            ? 'Saving...'
                            : 'Save Changes',
                        onPressed: state is GrowthLoading
                            ? () {}
                            : () {
                                final weight = double.tryParse(
                                    weightController.text.trim());
                                final height = double.tryParse(
                                    heightController.text.trim());

                                if (weight == null || weight <= 0) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content:
                                              Text("Enter valid weight")));
                                  return;
                                }
                                if (height == null || height <= 0) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content:
                                              Text("Enter valid height")));
                                  return;
                                }
                                if (selectedDate == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content:
                                              Text("Select a date")));
                                  return;
                                }

                                ///  نستخدم fromDateTime
                                context.read<GrowthCubit>().addGrowthRecord(
                                      GrowthRecordRequest.fromDateTime(
                                        childId: widget.childId,
                                        weightKg: weight,
                                        heightCm: height,
                                        date: selectedDate!,
                                      ),
                                    );
                              },
                      ),

                      24.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}