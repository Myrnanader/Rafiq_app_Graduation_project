import 'package:flutter/material.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.title,
    required this.hint,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.font16Medium.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          10.ph,
          TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                color: AppColors.neutralGray,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.silver, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.neutralGray,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
