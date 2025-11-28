import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';

class WeightStepperInput extends StatefulWidget {
  const WeightStepperInput({super.key});

  @override
  State<WeightStepperInput> createState() => _WeightStepperInputState();
}

class _WeightStepperInputState extends State<WeightStepperInput> {
  int _weight = 0;
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weightController.text = _weight.toString().padLeft(2, '0');
  }

  void _decrementWeight() {
    if (_weight > 0) {
      setState(() {
        _weight--;
        _weightController.text = _weight.toString().padLeft(2, '0');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Weight',
            style: AppTextStyles.font16Medium,
          ),
          10.ph,

          Container(
            height: 42,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13.0, bottom: 26),
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      style: AppTextStyles.font13Medium.copyWith(color: AppColors.ashGray),
                      onChanged: (value) {
                        setState(() {
                          _weight = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  width: 1.5,
                  height: 42.0,
                  color: AppColors.primary,
                ),

                SizedBox(
                  height: 42.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 21.0,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(
                            "assets/icons/down_arrow.svg",
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                              AppColors.softPurple,
                              BlendMode.srcIn, )                          ),
                          onPressed: _decrementWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }
}