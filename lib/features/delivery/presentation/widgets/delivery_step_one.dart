import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/delivery_text_field.dart';
import '../widgets/delivery_dropdown.dart';

class DeliveryStepOne extends StatelessWidget {
  const DeliveryStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        63.h.verticalSpace,
        DeliveryTextField(
          label: '1. How many weeks pregnant are you now?',
          hint: 'Enter a number (e.g., 28, 32, 38)',
        ),
        DeliveryDropdown(
          label:
              '2. Did the fetus show signs of distress during pregnancy?',
          
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
        DeliveryDropdown(
          label:
              '3. Are you pregnant with twins or more?',
          
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
        DeliveryDropdown(
          label:
              '4. Did you experience bleeding during pregnancy?',
         
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
      ],
    );
  }
}