import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/labled_form_field.dart';

class DoctorInformationScreen extends StatelessWidget {
  const DoctorInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final universityController = TextEditingController();
    final specialtiesController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                34.h.ph,
                CustomAppBar(
                  text: 'Doctor information',
                  backRoute: AppRoutes.selectRoleScreen,
                ),
                146.h.ph,

                // Graduation University field
                LabeledFormField(
                  labelText: "Graduation University",
                  hintText: "Enter Graduation University",
                  controller: universityController,
                  validator: (value) =>
                      value != null && value.isNotEmpty ? null : 'Required',
                ),
                16.h.ph,

                // Medical Specialties field
                LabeledFormField(
                  labelText: "Medical Specialties",
                  hintText: "Enter Medical Specialties",
                  controller: specialtiesController,
                  validator: (value) =>
                      value != null && value.isNotEmpty ? null : 'Required',
                ),

                280.h.ph,
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.go(AppRoutes.accountCreatedSuccessfullyScreen);
                    }
                  },
                ),
                56.h.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}