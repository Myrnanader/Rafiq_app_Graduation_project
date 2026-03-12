import 'package:flutter/material.dart';
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
