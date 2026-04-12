import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'growth_glass_text_field.dart';

class GrowthDatePickerField extends StatefulWidget {
  final Function(DateTime)? onDateSelected;

  const GrowthDatePickerField({
    super.key,
    this.onDateSelected,
  });

  @override
  State<GrowthDatePickerField> createState() =>
      _GrowthDatePickerFieldState();
}

class _GrowthDatePickerFieldState extends State<GrowthDatePickerField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GrowthGlassTextField(
      hintText: selectedDate == null
          ? 'Select date'
          : DateFormat('dd/MM/yyyy').format(selectedDate!),
      readOnly: true,
      suffixIcon: Icon(
        Icons.calendar_today_outlined,
        color: AppColors.darkGray.withValues(alpha: 0.7),
      ),
      onTap: _openDatePicker,
    );
  }

  Future<void> _openDatePicker() async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppGradientBackground(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CalendarDatePicker2(
                  value: selectedDate == null ? [] : [selectedDate],
                  config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.single,
                    selectedDayHighlightColor: AppColors.onPrimary,
                    selectedDayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    dayTextStyle: const TextStyle(color: AppColors.onPrimary),
                    weekdayLabelTextStyle: const TextStyle(
                      color: AppColors.onPrimary,
                    ),
                    controlsTextStyle: const TextStyle(
                      color: AppColors.onPrimary,
                    ),
                  ),

                  ///  هنا التعديل المهم
                  onValueChanged: (dates) {
                    if (dates.isNotEmpty) {
                      final pickedDate = dates.first;

                      setState(() {
                        selectedDate = pickedDate;
                      });

                      ///  نبعت القيمة للـ screen
                      widget.onDateSelected?.call(pickedDate);

                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}