/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_app_bar.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_date_picker_field.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_glass_text_field.dart';

class AddGrowthRecordScreen extends StatelessWidget {
  const AddGrowthRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onBack: () => context.go(AppRoutes.growthTrackerScreen),
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
                            style: AppTextStyles.font14Regular.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),
                        48.h.verticalSpace,
                        // ===== Weight =====
                        Text('Weight', style: AppTextStyles.font16Medium),
                        8.h.verticalSpace,
                        const GrowthGlassTextField(
                          hintText: '0.0',
                          suffixText: 'Kg',
                          keyboardType: TextInputType.number,
                        ),
                        20.h.verticalSpace,
                        // ===== Height =====
                        Text('Height', style: AppTextStyles.font16Medium),
                        8.h.verticalSpace,
                        const GrowthGlassTextField(
                          hintText: '0.0',
                          suffixText: 'cm',
                          keyboardType: TextInputType.number,
                        ),
                        20.h.verticalSpace,
                        // ===== Date =====
                        Text(
                          'Measurement Date',
                          style: AppTextStyles.font16Medium,
                        ),
                        8.h.verticalSpace,
                        const GrowthDatePickerField(),
                        120.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
                AppPrimaryButton(
                  text: 'Save Changes',
                  onPressed: () {
                    context.go(AppRoutes.growthSuccessScreen);
                  },
                ),
                24.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/common/widgets/app_primary_button.dart';
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
  const AddGrowthRecordScreen({super.key});

  @override
  State<AddGrowthRecordScreen> createState() =>
      _AddGrowthRecordScreenState();
}

class _AddGrowthRecordScreenState extends State<AddGrowthRecordScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<GrowthCubit>(),
      child: BlocConsumer<GrowthCubit, GrowthState>(
        listener: (context, state) {
          if (state is GrowthAddSuccess) {
            context.go(AppRoutes.growthSuccessScreen);
          } else if (state is GrowthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<GrowthCubit>();

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
                        onBack: () =>
                            context.go(AppRoutes.growthTrackerScreen),
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
                                  style: AppTextStyles.font14Regular.copyWith(
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ),
                              48.h.verticalSpace,

                              /// Weight
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

                              /// Height
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

                              /// Date
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

                      /// Button
                      AppPrimaryButton(
                        text: state is GrowthLoading
                            ? 'Loading...'
                            : 'Save Changes',
                        onPressed: () {
                          final weight =
                              double.tryParse(weightController.text);
                          final height =
                              double.tryParse(heightController.text);

                          if (weight == null ||
                              height == null ||
                              selectedDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter valid data")),
                            );
                            return;
                          }

                          cubit.addGrowthRecord(
                            GrowthRecordRequest(
                              childId: "PUT_CHILD_ID_HERE",
                              weightKg: weight,
                              heightCm: height,
                              measurementDate: selectedDate!,
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