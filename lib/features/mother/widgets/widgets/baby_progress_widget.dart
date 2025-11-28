import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class BabyProgress extends StatefulWidget {
  const BabyProgress({super.key});

  @override
  State<BabyProgress> createState() => _BabyProgressState();
}

class _BabyProgressState extends State<BabyProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 7,
                  backgroundColor: AppColors.lightBackground,
                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/baby.svg',
                  width: 77.19,
                  height: 84.92,
                ),
              ),
            ],
          ),
        ),
        10.ph,
        Text("90 days was left", style: AppTextStyles.font14Regular),
      ],
    );
  }
}
