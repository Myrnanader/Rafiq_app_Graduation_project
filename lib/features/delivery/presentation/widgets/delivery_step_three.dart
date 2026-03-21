import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/delivery_text_field.dart';

class DeliveryStepThree extends StatelessWidget {
  const DeliveryStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        63.h.verticalSpace,
        DeliveryTextField(
          label:
              '9. What is your height (in cm)?',
          hint: 'Enter a number (e.g., 160, 165, 170)',
        ),
        DeliveryTextField(
          label:
              '10. How many times have you given birth?',
          hint: 'Enter a number (e.g., 0, 1, 2, 3)',
        ),
        DeliveryTextField(
          label: '11.What is your diastolic blood pressure (bottom number)?',
          
          hint: 'enter your diastolic blood pressure',
        ),
        DeliveryTextField(
          label: '12. Do you have obesity?',
          
          hint: 'enter your systolic blood pressure',
        ),
      ],
    );
  }
}