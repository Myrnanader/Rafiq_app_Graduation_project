import 'package:flutter/material.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/food_model.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  final VoidCallback? onDelete;
  final bool isAdmin;

  const FoodCard({super.key, required this.food, this.onDelete, required this.isAdmin});

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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child:
          // food.fullImageUrl != null
          //     ? Image.network(
          //         food.fullImageUrl!,
          //         width: 50,
          //         height: 50,
          //         fit: BoxFit.cover,
          //         errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
          //       )
          //     :
          const Icon(Icons.fastfood),
        ),

        title: Text(
          food.name,
          style: AppTextStyles.font16Medium.copyWith(color: AppColors.midNight),
        ),

        subtitle: Text(
          food.description ?? "",
          style: AppTextStyles.font13Regular.copyWith(
            color: AppColors.darkGray,
          ),
        ),

        trailing: isAdmin
            ? IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete, color: AppColors.neutralGray),
              )
            : null,
      ),
    );
  }
}
