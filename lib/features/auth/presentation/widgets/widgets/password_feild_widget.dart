import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordField({super.key, required this.controller, this.validator});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        8.h.ph,
        AppTextFormField(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: AppColors.lightAppColors,
            size: 24.sp,
          ),
          maxLines: 1,
          hintText: 'Password',
          controller: widget.controller,
          isObscureText: isObscure,
          validator:
              widget.validator ??
              (value) => value != null && value.length >= 6
                  ? null
                  : 'Password too short',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.remove_red_eye_outlined,
              color: AppColors.lightAppColors,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
