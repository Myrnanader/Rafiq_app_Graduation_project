import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/delivery_prediction_cubit.dart';
import '../widgets/delivery_text_field.dart';

class DeliveryStepThree extends StatelessWidget {
  const DeliveryStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DeliveryPredictionCubit>();

    return Column(
      children: [
        63.h.verticalSpace,
        DeliveryTextField(
          label: '9. What is your height (in cm)?',
          hint: 'Enter a number (e.g., 160, 165, 170)',
          initialValue: cubit.features[4]?.toString(),
          onChanged: (text) {
            final parsed = double.tryParse(text);
            if (parsed != null) cubit.updateFeature(4, parsed); // height
          },
        ),
        DeliveryTextField(
          label: '10. How many times have you given birth?',
          hint: 'Enter a number (e.g., 0, 1, 2, 3)',
          initialValue: cubit.features[5]?.toString(),
          onChanged: (text) {
            final parsed = double.tryParse(text);
            if (parsed != null) cubit.updateFeature(5, parsed); // parity
          },
        ),
        DeliveryTextField(
          label: '11. What is your diastolic blood pressure (bottom number)?',
          hint: 'Enter your diastolic blood pressure',
          initialValue: cubit.features[11]?.toString(),
          onChanged: (text) {
            final parsed = double.tryParse(text);
            if (parsed != null) {
              cubit.updateFeature(11, parsed); // diastolic_blood_pressure
            }
          },
        ),
        DeliveryTextField(
          label: '12. What is your systolic blood pressure (top number)?',
          hint: 'Enter your systolic blood pressure',
          initialValue: cubit.features[10]?.toString(),
          onChanged: (text) {
            final parsed = double.tryParse(text);
            if (parsed != null) {
              cubit.updateFeature(10, parsed); // systolic_blood_pressure
            }
          },
        ),
      ],
    );
  }
}