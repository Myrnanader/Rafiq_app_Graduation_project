import 'package:flutter/material.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../views/exercise_details_screen.dart';
import 'exercise_item.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseItem exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      shadowColor: const Color(0x50000000),
      elevation: 8,
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.lightBackground),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            exercise.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          exercise.name,
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.onPrimaryFixed),
        ),
        subtitle: Text(
          exercise.dueOn,
          style: AppTextStyles.font10Regular.copyWith(color: AppColors.neutralGray),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExerciseDetailsScreen(exercise: exercise),
            ),
          );
        },
      ),
    );
  }
}
