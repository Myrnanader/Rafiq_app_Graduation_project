import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/common/widgets/survey_question_label.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DeliveryTextField extends StatelessWidget {
  final String label;
  final String hint;

  const DeliveryTextField({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Question label (عام)
          SurveyQuestionLabel(text: label),
          8.h.verticalSpace,

          /// 🔹 Text field
          AppTextFormField(
            hintText: hint,
            keyboardType: TextInputType.number,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.onSecondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.onPrimary,
                width: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}