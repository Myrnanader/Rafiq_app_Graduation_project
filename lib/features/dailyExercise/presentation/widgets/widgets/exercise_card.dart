import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;
  final VoidCallback onDelete;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
          child: exercise.fullImageUrl != null
              ? Image.network(
            exercise.fullImageUrl!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          )
              : const Icon(Icons.fitness_center),
        ),

        title: Text(
          exercise.title,
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.onPrimaryFixed),
        ),

        subtitle: Text(
          exercise.shortSummary,
          style: AppTextStyles.font10Regular.copyWith(color: AppColors.neutralGray),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.grey[300]),
          onPressed: onDelete,
        ),

        onTap: () {
          context.push(
            AppRoutes.exerciseDetailsScreen,
            extra: exercise,
          );
        },
      ),
    );
  }
}
