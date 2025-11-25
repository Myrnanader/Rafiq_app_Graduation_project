import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class LabeledFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const LabeledFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        8.h.ph,
        AppTextFormField(
          controller: controller,
          hintText: hintText,
          prefixIcon: prefixIcon,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}