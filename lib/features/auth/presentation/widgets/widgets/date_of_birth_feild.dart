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
  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.onPrimary;

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
          controller: widget.controller,
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
                initialDate: DateTime(2000),
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
                final formatted =
                    "${picked.day}/${picked.month}/${picked.year}";
                setState(() {
                  widget.controller.text = formatted;
                });

                // ✅ تحديث الفاليديشن يدويًا
                Form.of(context).validate();
              }
            },
          ),
          validator: (value) =>
              value != null && value.isNotEmpty ? null : 'Select date',
        ),
      ],
    );
  }
}