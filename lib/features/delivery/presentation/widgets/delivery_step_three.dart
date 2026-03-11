import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/delivery_text_field.dart';
import '../widgets/delivery_dropdown.dart';

class DeliveryStepThree extends StatelessWidget {
  const DeliveryStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        63.h.verticalSpace,
        DeliveryTextField(
          label:
              '7. What is your diastolic blood pressure (bottom number)?',
          hint: 'enter your diastolic blood pressure',
        ),
        DeliveryTextField(
          label:
              '8. What week of pregnancy are you currently in?',
          hint: 'enter your current pregnancy week',
        ),
        DeliveryDropdown(
          label: '9. Do you have obesity?',
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
      ],
    );
  }
}