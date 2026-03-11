import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/vaccine_details_info_row.dart';
import '../widgets/widgets/vaccine_item.dart';
import '../widgets/widgets/vaccine_schedule.dart';

class VaccineDetailsScreen extends StatelessWidget {
  final VaccineItem vaccine;

  const VaccineDetailsScreen({super.key, required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSecondary,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
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
              "Oral Polio Vaccine",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
              25.ph,
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.silver),
                ),
                child: Column(
                  children: [
                    VaccineDetailsInfoRow(
                      icon: Icons.create_outlined,
                      title: "Type",
                      subtitle: "Live attenuated(Oral drops)",
                    ),
                    VaccineDetailsInfoRow(
                      icon: Icons.shield_outlined,
                      title: "Protects From",
                      subtitle: "Prevents Poliomyelitis",
                    ),
                    VaccineDetailsInfoRow(
                      icon: Icons.calendar_month_outlined,
                      title: "Recommended Age",
                      subtitle: "At Birth",
                    ),
                  ],
                ),
              ),
              30.ph,

              Text(
                "Vaccine Schedule",
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.onBackgroundLight,
                ),
              ),
              20.ph,

              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.silver),
                ),
                child: Column(
                  children: [
                    VaccineSchedule(
                      stepNumber: 1,
                      title: "Zero Dose",
                      subtitle: "At Birth",
                    ),
                    VaccineSchedule(
                      stepNumber: 2,
                      title: "1st Dose",
                      subtitle: "2 months",
                    ),
                    VaccineSchedule(
                      stepNumber: 3,
                      title: "2nd Dose",
                      subtitle: "4 months",
                    ),
                    VaccineSchedule(
                      stepNumber: 4,
                      title: "3rd Dose",
                      subtitle: "6 months",
                      isLast: true,
                    ),
                  ],
                ),
              ),

              30.ph,

              Text(
                "Common Side Effects",
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.onBackgroundLight,
                ),
              ),
              20.ph,
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.silver),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most side effects are mild and temporary:",
                      style: AppTextStyles.font13Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    15.ph,
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("• Slight diarrhea"),
                          Text("• Mild fever"),
                          Text("• Slight diarrhea"),
                          Text("• Mild fever"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
