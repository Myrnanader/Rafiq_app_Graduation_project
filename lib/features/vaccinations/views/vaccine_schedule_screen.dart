import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import '../../../core/helpers/date_picker_field.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../../mother/widgets/widgets/custom_input_field.dart';

class VaccineScheduleScreen extends StatefulWidget {

  const VaccineScheduleScreen({super.key});

  @override
  State<VaccineScheduleScreen> createState() => _VaccineScheduleScreenState();
}

class _VaccineScheduleScreenState extends State<VaccineScheduleScreen> {
  bool reminderSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSecondary,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).go(AppRoutes.vaccinationsScreen),
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.onPrimaryFixed,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        title: Column(
          children: [
            25.ph,
            Text(
              "Schedule Vaccination",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body:
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.onSecondary, AppColors.lightBackground],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Set reminders and manage your baby’s vaccination appointments easily',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    50.ph,
                    Text(
                      'Vaccination Date',
                      style: AppTextStyles.font16Medium.copyWith(
                        color: AppColors.onBackgroundLight,
                      ),
                    ),
                    8.ph,
                    const DatePickerField(),
                    12.ph,
                    CustomInputField(
                      title: 'Vaccination Time',
                      hint: '10.00',
                      keyboardType: TextInputType.number,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'pm',
                          style: AppTextStyles.font13Regular.copyWith(
                            color: AppColors.neutralGray,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      reminderSaved = true;
                    });
                    context.go(AppRoutes.mainNavigationBarScreen);},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save Reminder',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
              ),
            ),
            40.ph,
          ],
        ),
      ),
    );
  }
}
