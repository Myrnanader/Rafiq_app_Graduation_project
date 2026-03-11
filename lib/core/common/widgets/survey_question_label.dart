import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class SurveyQuestionLabel extends StatelessWidget {
  final String text;

  const SurveyQuestionLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final number = _questionNumber(text);
    final question = _questionText(text);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// رقم السؤال
        Text(
          number,
          style: AppTextStyles.font14Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        6.w.horizontalSpace,

        /// نص السؤال (يلف تحت بعضه)
        Expanded(
          child: Text(
            question,
            style: AppTextStyles.font14Medium.copyWith(
              color: AppColors.onPrimaryFixed,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  String _questionNumber(String label) {
    final index = label.indexOf('.');
    return index != -1 ? label.substring(0, index + 1) : '';
  }

  String _questionText(String label) {
    final index = label.indexOf('.');
    return index != -1 ? label.substring(index + 1).trim() : label;
  }
}