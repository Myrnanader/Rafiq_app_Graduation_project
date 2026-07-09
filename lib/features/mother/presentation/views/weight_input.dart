import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class WeightStepperInput extends StatefulWidget {
  final Function(int)? onChanged; //  إضافة callback

  const WeightStepperInput({super.key, this.onChanged});

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

      widget.onChanged?.call(_weight); //  رجع القيمة
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Weight', style: AppTextStyles.font16Medium),
          10.ph,

          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: AppTextStyles.font13Medium.copyWith(
                        color: AppColors.ashGray,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _weight = int.tryParse(value) ?? 0;
                        });

                        widget.onChanged?.call(_weight); // ✅
                      },
                    ),
                  ),
                ),

                Container(width: 1.5, height: 42.0, color: AppColors.primary),

                GestureDetector(
                  onTap: _decrementWeight,
                  child: SizedBox(
                    height: 48,
                    child: Column(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(
                            "assets/icons/down_arrow.svg",
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                              AppColors.softPurple,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: _decrementWeight,
                        ),
                      ],
                    ),
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
