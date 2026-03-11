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
          label: '1. What is your age?',
          hint: 'enter your age',
        ),
        DeliveryDropdown(
          label:
              '2. How many times have you been pregnant in your life, whether the pregnancy was completed or not?',
          max: 10,
          hint: 'Select a number from 1 to 10',
        ),
        DeliveryDropdown(
          label:
              '3. How many pregnancies reached a viable gestational age?',
          max: 10,
          hint: 'Select a number from 0 to 10',
        ),
      ],
    );
  }
}