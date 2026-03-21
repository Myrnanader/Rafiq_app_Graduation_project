import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
// import 'package:rafiq_app/features/doctors/models/hospital_model.dart';
// import 'package:rafiq_app/features/doctors/widget/hospital_card.dart';
// import 'package:rafiq_app/features/doctors/widget/search_bar.dart';
// import 'package:rafiq_app/features/growth/presentation/widgets/growth_app_bar.dart';

import '../../../core/routing/app_routes.dart';
import '../hospital_model.dart';
import '../widgets/growth_app_bar.dart';
import '../widgets/hospital_card.dart';
import '../widgets/search_bar.dart';

class NearbyHospitalScreen extends StatelessWidget {
  NearbyHospitalScreen({super.key});

  final List<HospitalModel> hospitals = [
    HospitalModel(
      category: 'Maternity',
      name: 'Al-Hayat International Hospital',
      distance: '1.4 Km',
      doctorsCount: 4,
    ),
    HospitalModel(
      category: 'Maternity',
      name: 'Al-Shifa Hospital',
      distance: '2.1 Km',
      doctorsCount: 7,
    ),
    HospitalModel(
      category: 'Maternity',
      name: 'Al-Noor Specialized Hospital',
      distance: '3.5 Km',
      doctorsCount: 9,
    ),
    HospitalModel(
      category: 'Maternity',
      name: 'Mansoura  Hospital',
      distance: '4.2 Km',
      doctorsCount: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              50.h.verticalSpace,
              const GrowthAppBar(
                title: 'Nearby Hospital-\nCurrent Availability',
              ),

              16.h.verticalSpace,

              const HospitalSearchBar(),

              1.h.verticalSpace,

              Expanded(
                child: ListView.separated(
                  itemCount: hospitals.length,
                  separatorBuilder: (_, _) => 16.h.verticalSpace,
                  itemBuilder: (context, index) {
                    return HospitalCard(
                      hospital: hospitals[index],
                      onTap: () {
                        context.push(AppRoutes.hospitalLiveDoctorScreen);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
