import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  /// ✅ أضفنا validator هنا
  final String? Function(String?)? validator;

  const EmailField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        8.h.ph,
        AppTextFormField(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: AppColors.lightAppColors,
            size: 24.sp,
          ),
          hintText: 'name@gmail.com',
          controller: controller,
          keyboardType: TextInputType.emailAddress,

          ///  لو مفيش validator يبقى default
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Enter email";
                }
                if (!value.contains("@")) {
                  return "Enter valid email";
                }
                return null;
              },
        ),
      ],
    );
  }
}