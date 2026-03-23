import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/custom_text_form_field.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DateOfBirthField extends StatefulWidget {
  final TextEditingController controller;

  const DateOfBirthField({super.key, required this.controller});

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  DateTime? selectedDate;

  /// ✅ controller يخزن ISO للـ API
  /// ✅ _displayText يعرض dd/MM/yyyy للمستخدم
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.onPrimary;

    /// ✅ controller منفصل للعرض فقط
    final displayController = TextEditingController(text: _displayText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        8.h.ph,

        AppTextFormField(
          /// ✅ نعرض التاريخ المقروء - مش ISO
          controller: displayController,
          hintText: 'Select date',
          readOnly: true,

          suffixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: AppColors.lightAppColors,
              size: 24.sp,
            ),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: primaryColor,
                        onPrimary: Colors.white,
                        onSurface: AppColors.onBackgroundLight,
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (picked != null) {
                selectedDate = picked;

                /// ✅ للعرض: dd/MM/yyyy
                final day = picked.day.toString().padLeft(2, '0');
                final month = picked.month.toString().padLeft(2, '0');
                final year = picked.year.toString();
                final displayDate = "$day/$month/$year";

                /// ✅ للـ API: ISO 8601 كامل (2000-01-15T00:00:00.000Z)
                final isoDate = picked.toUtc().toIso8601String();

                setState(() {
                  _displayText = displayDate;
                  /// controller الأصلي بيخزن ISO للـ API
                  widget.controller.text = isoDate;
                });
              }
            },
          ),

          validator: (value) {
            /// ✅ validate على الـ controller الأصلي (ISO) مش الـ display
            if (widget.controller.text.isEmpty) {
              return 'Please select your date of birth';
            }
            return null;
          },
        ),
      ],
    );
  }
}