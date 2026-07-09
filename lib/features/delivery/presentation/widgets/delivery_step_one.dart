import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/delivery_prediction_cubit.dart';
import '../widgets/delivery_text_field.dart';
import '../widgets/delivery_dropdown.dart';
import 'delivery_answer_mapper.dart';

class DeliveryStepOne extends StatelessWidget {
  const DeliveryStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DeliveryPredictionCubit>();

    return Column(
      children: [
        63.h.verticalSpace,
        DeliveryTextField(
          label: '1. How many weeks pregnant are you now?',
          hint: 'Enter a number (e.g., 28, 32, 38)',
          initialValue: cubit.features[6]?.toString(),
          onChanged: (text) {
            final parsed = double.tryParse(text);
            if (parsed != null) cubit.updateFeature(6, parsed); // gestation
          },
        ),
        DeliveryDropdown(
          label: '2. Did the fetus show signs of distress during pregnancy?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[0]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) cubit.updateFeature(0, parsed); // fetal_compromise
          },
        ),
        DeliveryDropdown(
          label: '3. Are you pregnant with twins or more?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[3]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) cubit.updateFeature(3, parsed); // twins_or_more
          },
        ),
        DeliveryDropdown(
          label: '4. Did you experience bleeding during pregnancy?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[8]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) {
              cubit.updateFeature(8, parsed); // antepartum_haemorrhage
            }
          },
        ),
      ],
    );
  }
}