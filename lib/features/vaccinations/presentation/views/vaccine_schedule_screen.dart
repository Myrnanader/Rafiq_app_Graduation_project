/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import '../../../../core/helpers/date_picker_field.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';

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
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/date_picker_field.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';
import '../cubit/vaccinations_cubit.dart';
import '../cubit/vaccinations_state.dart';

class VaccineScheduleScreen extends StatefulWidget {
  final String vaccineId;

  const VaccineScheduleScreen({super.key, required this.vaccineId});

  @override
  State<VaccineScheduleScreen> createState() => _VaccineScheduleScreenState();
}

class _VaccineScheduleScreenState extends State<VaccineScheduleScreen> {
  ///  nullable - مفيش default fake value
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VaccinationsCubit, VaccinationsState>(
      listener: (context, state) {
        if (state is VaccinationActionSuccess) {
          context.pop();
        }
        if (state is VaccinationActionError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.onSecondary,
          leading: IconButton(
            ///  context.pop() بدل GoRouter.of(context).pop
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              width: 20,
              height: 20,
            ),
          ),
          title: Text(
            "Schedule Vaccination",
            style: AppTextStyles.font20SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.onSecondary, AppColors.lightBackground],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Set reminders and manage your baby\u2019s vaccination appointments easily',
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

                      ///  DatePicker مع callback حقيقي
                      DatePickerField(
                        onDateSelected: (date) {
                          setState(() {
                            ///  ISO string بدون time component
                            selectedDate =
                                "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                          });
                        },
                      ),

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
                  child: BlocBuilder<VaccinationsCubit, VaccinationsState>(
                    builder: (context, state) {
                      final isLoading = state is VaccinationActionLoading;

                      return ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                /// ✅ Validate إن التاريخ اتاخد
                                if (selectedDate == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please select a date first",
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                context
                                    .read<VaccinationsCubit>()
                                    .scheduleVaccine(
                                      widget.vaccineId,
                                      selectedDate!,
                                    );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Save Reminder',
                                style: AppTextStyles.font16Medium.copyWith(
                                  color: AppColors.lightBackground,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),
              40.ph,
            ],
          ),
        ),
      ),
    );
  }
}
