import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import 'package:rafiq_app/features/auth/presentation/widgets/widgets/labled_form_field.dart';

class MotherInformationScreen extends StatelessWidget {
  const MotherInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fatherIdController = TextEditingController();
    final pregnancyWeekController = TextEditingController();
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
                  text: 'Mother information',
                  backRoute: AppRoutes.selectRoleScreen,
                ),
                146.h.ph,

                LabeledFormField(
                  labelText: "Father's ID",
                  hintText: "Enter Father's id",
                  controller: fatherIdController,
                  validator: (value) =>
                      value != null && value.isNotEmpty ? null : 'Required',
                ),
                16.h.ph,

                LabeledFormField(
                  labelText: "Current Pregnancy Week",
                  hintText: "Enter Current Pregnancy week",
                  controller: pregnancyWeekController,
                  keyboardType: TextInputType.number,
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
