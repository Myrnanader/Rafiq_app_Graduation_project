import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/common/widgets/survey_question_label.dart';

import 'package:rafiq_app/core/theming/app_colors.dart';

class DeliveryTextField extends StatefulWidget {
  final String label;
  final String hint;

  /// Pre-fills the field when re-entering this step (e.g. after Back).
  final String? initialValue;

  /// Called on every keystroke so the parent can forward the value to
  /// the Cubit.
  final ValueChanged<String>? onChanged;

  const DeliveryTextField({
    super.key,
    required this.label,
    required this.hint,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<DeliveryTextField> createState() => _DeliveryTextFieldState();
}

class _DeliveryTextFieldState extends State<DeliveryTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///  Question label
          SurveyQuestionLabel(text: widget.label),
          8.h.verticalSpace,

          ///  Text field
          AppTextFormField(
            controller: _controller,
            hintText: widget.hint,
            keyboardType: TextInputType.number,
            onChanged: widget.onChanged,
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