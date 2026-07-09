import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:rafiq_app/core/common/widgets/survey_question_label.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class DeliveryDropdown extends StatefulWidget {
  final String label;
  final int? max;
  final List<String>? options;
  final String hint;

  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const DeliveryDropdown({
    super.key,
    required this.label,
    this.max,
    this.options,
    this.hint = 'Select',
    this.initialValue,
    this.onChanged,
  });

  @override
  State<DeliveryDropdown> createState() => _DeliveryDropdownState();
}

class _DeliveryDropdownState extends State<DeliveryDropdown> {
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.options ??
        List.generate((widget.max ?? -1) + 1, (i) => i.toString());

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Question label
          SurveyQuestionLabel(text: widget.label),
          8.h.verticalSpace,

          /// Dropdown
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: value,
              hint: Text(
                widget.hint,
                style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightAppColors
                ),
              ),
              items: items
                  .map(
                    (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: AppTextStyles.font14Regular,
                  ),
                ),
              )
                  .toList(),
              onChanged: (v) {
                setState(() {
                  value = v;
                });
                widget.onChanged?.call(v);
              },

              buttonStyleData: ButtonStyleData(
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: value == null
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
      ),
    );
  }
}