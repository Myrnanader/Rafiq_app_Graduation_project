import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../features/growth/presentation/widgets/growth_glass_text_field.dart';

class DatePickerField extends StatefulWidget {
  ///  Callback بيرجع الـ DateTime للـ parent
  final Function(DateTime)? onDateSelected;

  const DatePickerField({
    super.key,
    this.onDateSelected,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GrowthGlassTextField(
      hintText: selectedDate == null
          ? '3/3/2026'
          : DateFormat('dd/MM/yyyy').format(selectedDate!),
      readOnly: true,
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SvgPicture.asset(
          'assets/icons/calender.svg',
          width: 10,
          height: 10,
          colorFilter: const ColorFilter.mode(
            AppColors.neutralGray,
            BlendMode.srcIn,
          ),
        ),
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
            borderRadius: BorderRadius.circular(30),
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
                    dayTextStyle:
                        const TextStyle(color: AppColors.onPrimary),
                    weekdayLabelTextStyle: const TextStyle(
                      color: AppColors.onPrimary,
                    ),
                    controlsTextStyle: const TextStyle(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  onValueChanged: (dates) {
                    if (dates.isNotEmpty && dates.first != null) {
                      setState(() {
                        selectedDate = dates.first;
                      });

                      ///  نبعت القيمة للـ parent
                      widget.onDateSelected?.call(dates.first!);

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