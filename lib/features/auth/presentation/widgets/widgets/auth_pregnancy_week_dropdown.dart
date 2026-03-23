import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:rafiq_app/core/common/widgets/survey_question_label.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

/// ✅ هذا الفايل صح 100% - مش محتاج تعديل
class AuthPregnancyWeekDropdown extends StatefulWidget {
  final Function(int?) onChanged;
  final int? initialValue;

  const AuthPregnancyWeekDropdown({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<AuthPregnancyWeekDropdown> createState() =>
      _AuthPregnancyWeekDropdownState();
}

class _AuthPregnancyWeekDropdownState
    extends State<AuthPregnancyWeekDropdown> {
  int? selectedWeek;

  @override
  void initState() {
    super.initState();
    selectedWeek = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(40, (i) => i + 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SurveyQuestionLabel(text: "Current Pregnancy Week"),
        8.h.verticalSpace,

        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isExpanded: true,
            value: selectedWeek,

            hint: Text(
              "Select your current week",
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightAppColors,
              ),
            ),

            items: items.map((week) {
              return DropdownMenuItem<int>(
                value: week,
                child: Text(
                  week.toString(),
                  style: AppTextStyles.font14Regular,
                ),
              );
            }).toList(),

            onChanged: (value) {
              setState(() {
                selectedWeek = value;
              });
              widget.onChanged(value);
            },

            buttonStyleData: ButtonStyleData(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: selectedWeek == null
                      ? AppColors.onSecondary
                      : AppColors.onPrimary,
                  width: 1.4,
                ),
              ),
            ),

            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.onPrimary,
              ),
            ),

            dropdownStyleData: DropdownStyleData(
              maxHeight: 220.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              elevation: 4,
            ),

            menuItemStyleData: MenuItemStyleData(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
      ],
    );
  }
}