import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class FullNameField extends StatelessWidget {
  final TextEditingController controller;
  const FullNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        8.h.ph,
        AppTextFormField(
          controller: controller,
          hintText: 'Myrna Nader',
          prefixIcon: Icon(Icons.person_outline, color: AppColors.lightAppColors,size:24.sp),
          validator: (value) =>
              value != null && value.length >= 3 ? null : 'Enter valid name',
        ),
      ],
    );
  }
}
