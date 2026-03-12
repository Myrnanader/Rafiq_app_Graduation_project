import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/custom_input_field.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../core/common/widgets/app_gradient_background.dart';
import '../../../core/routing/app_routes.dart';
import '../../delivery/presentation/widgets/delivery_common_app_bar.dart';

class HospitalLiveDoctorScreen extends StatefulWidget {
  const HospitalLiveDoctorScreen({super.key});

  @override
  HospitalLiveDoctorScreenState createState() =>
      HospitalLiveDoctorScreenState();
}

class HospitalLiveDoctorScreenState extends State<HospitalLiveDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.h.verticalSpace,
                DeliveryCommonAppBar(
                  title: 'Hospital Live Doctor',
                  onBack: () => GoRouterHelper(context).pop(),
                ),
                Text(
                  "Al-Hayat International\nHospital",
                  style: AppTextStyles.font17Medium.copyWith(
                    color: AppColors.onPrimaryFixed,
                  ),
                ),
                10.ph,
                Text(
                  "Doctors on Duty Now",
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.neutralGray,
                  ),
                ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                color: AppColors.lightBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Sarah Mostafa",
                        style: AppTextStyles.font18Bold.copyWith(
                          color: AppColors.onSurfaceLight,
                        ),
                      ),
                      Text(
                        "Obstetrician",
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "On duty",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "Available for 1h 40m more",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: 0.6,
                                minHeight: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                          ),

                          18.pw,
                          Text(
                            "75%",
                            style: AppTextStyles.font12Regular.copyWith(
                              color: AppColors.onPrimaryFixed,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                color: AppColors.lightBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Eman Atia",
                        style: AppTextStyles.font18Bold.copyWith(
                          color: AppColors.onSurfaceLight,
                        ),
                      ),
                      Text(
                        "Obstetrician",
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "On duty",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "Available for 45m more",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: 0.9,
                                minHeight: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                          ),

                          18.pw,
                          Text(
                            "90%",
                            style: AppTextStyles.font12Regular.copyWith(
                              color: AppColors.onPrimaryFixed,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                color: AppColors.lightBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Magdy Naser",
                        style: AppTextStyles.font18Bold.copyWith(
                          color: AppColors.onSurfaceLight,
                        ),
                      ),
                      Text(
                        "Obstetrician",
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "On duty",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "Until 6:00 Pm",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: 0.45,
                                minHeight: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                          ),

                          18.pw,
                          Text(
                            "45%",
                            style: AppTextStyles.font12Regular.copyWith(
                              color: AppColors.onPrimaryFixed,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                color: AppColors.lightBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Ali Alazab",
                        style: AppTextStyles.font18Bold.copyWith(
                          color: AppColors.onSurfaceLight,
                        ),
                      ),
                      Text(
                        "Obstetrician",
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "On duty",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Text(
                        "Available for 2h more",
                        style: AppTextStyles.font12Medium.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: 0.85,
                                minHeight: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                          ),

                          18.pw,
                          Text(
                            "85%",
                            style: AppTextStyles.font12Regular.copyWith(
                              color: AppColors.onPrimaryFixed,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
