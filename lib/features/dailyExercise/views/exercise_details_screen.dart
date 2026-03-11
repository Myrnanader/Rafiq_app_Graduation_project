import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/exercise_item.dart';


class ExerciseDetailsScreen extends StatelessWidget {
  final ExerciseItem exercise;

  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.onPrimaryFixed,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        title: Column(
          children: [
            5.ph,
            Text(
              exercise.name,
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightSurface,
                // boxShadow: const [
                //   BoxShadow(
                //     color: Color(0x33000000),
                //     blurRadius: 30,
                //     offset: Offset(0, 12),
                //   ),
                // ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.asset(
                  'assets/images/breathing.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   exercise.describe,
                    //   style: AppTextStyles.font20SemiBold.copyWith(
                    //     color: AppColors.onBackgroundLight,
                    //   ),
                    // ),
                    // 10.ph,
                    // Text(
                    //   "Due On ${exercise.dueOn}",
                    //   style: AppTextStyles.font14Medium.copyWith(
                    //     color: AppColors.neutralGray,
                    //   ),
                    // ),
                    // 20.ph,
                    Text(
                      "Deep Breathing (Pranayama) is a simple yet powerful breathing practice used to calm the mind and energize the body. It involves slow, deep inhalation through the nose, allowing the lungs and abdomen to fully expand, followed by a gentle pause and a long, controlled exhalation. To practice, sit comfortably with a straight spine, relax your shoulders, and close your eyes. Inhale deeply through your nose for a few seconds, feel your chest and belly rise, then exhale slowly through the nose, releasing all the air. Repeat this cycle for several minutes while focusing on your breath, which helps reduce stress, improve concentration, and promote overall relaxation.\n\nSteps of Deep Breathing (Pranayama):\nSit comfortably in a quiet place with your spine straight.\nRelax your shoulders and place your hands on your knees or abdomen.\nClose your eyes and take a moment to calm your mind.\nInhale slowly and deeply through your nose, allowing your chest and abdomen to expand.\nHold the breath gently for a few seconds (without strain).\nExhale slowly through your nose, releasing all the air from your lungs.\nRepeat the breathing cycle for 5–10 minutes while focusing on your breath.",
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
