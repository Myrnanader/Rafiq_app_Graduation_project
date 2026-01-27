import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/delivery_text_field.dart';
import '../widgets/delivery_dropdown.dart';

class DeliveryStepTwo extends StatelessWidget {
  const DeliveryStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        63.h.verticalSpace,
        DeliveryDropdown(
          label:
              '4. How many times have you delivered by C-section before?',
          max: 6,
          hint: 'Select a number from 0 to 6',
        ),
        DeliveryDropdown(
          label:
              '5. Have you been diagnosed with gestational diabetes?',
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
        DeliveryTextField(
          label:
              '6. What is your systolic blood pressure (top number)?',
          hint: 'enter your systolic blood pressure',
        ),
      ],
    );
  }
}