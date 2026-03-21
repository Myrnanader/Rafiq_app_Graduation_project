import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              '5. Were you diagnosed with preeclampsia during pregnancy?',
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
        DeliveryDropdown(
          label:
              '6. Have you had any previous uterine surgery?',
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
        DeliveryDropdown(
          label:
              '7. How many previous C-sections have you had?',
          max:3,
          hint: 'Select from 0 to 3',
        ),
        DeliveryDropdown(
          label:
              '8. Did the doctor recommend a cesarean section due to multiple pregnancy?',
          options: ['Yes', 'No'],
          hint: 'Select yes or no',
        ),
      ],
    );
  }
}