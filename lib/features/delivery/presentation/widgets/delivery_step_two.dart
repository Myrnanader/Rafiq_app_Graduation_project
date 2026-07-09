import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/delivery_prediction_cubit.dart';
import '../widgets/delivery_dropdown.dart';
import 'delivery_answer_mapper.dart';

class DeliveryStepTwo extends StatelessWidget {
  const DeliveryStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DeliveryPredictionCubit>();

    return Column(
      children: [
        63.h.verticalSpace,
        DeliveryDropdown(
          label: '5. Were you diagnosed with preeclampsia during pregnancy?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[9]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) cubit.updateFeature(9, parsed); // pre_eclampsia
          },
        ),
        DeliveryDropdown(
          label: '6. Have you had any previous uterine surgery?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[1]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) {
              cubit.updateFeature(1, parsed); // previous_uterine_surgery
            }
          },
        ),
        DeliveryDropdown(
          label: '7. How many previous C-sections have you had?',
          max: 3,
          hint: 'Select from 0 to 3',
          initialValue: cubit.features[2]?.toInt().toString(),
          onChanged: (v) {
            final parsed = v == null ? null : double.tryParse(v);
            if (parsed != null) {
              cubit.updateFeature(2, parsed); // no_of_previous_c-sections
            }
          },
        ),
        DeliveryDropdown(
          label:
          '8. Did the doctor recommend a cesarean section due to multiple pregnancy?',
          options: const ['Yes', 'No'],
          hint: 'Select yes or no',
          initialValue: yesNoLabel(cubit.features[7]),
          onChanged: (v) {
            final parsed = yesNoToDouble(v);
            if (parsed != null) cubit.updateFeature(7, parsed); // multiple_pregnancy
          },
        ),
      ],
    );
  }
}