import 'package:flutter/material.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class FoodCard extends StatelessWidget {
  final FoodItem food;

  const FoodCard({super.key, required this.food});

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
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            food.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          food.title,
          style: AppTextStyles.font16Medium.copyWith(color: AppColors.midNight),
        ),
        subtitle: Text(
          food.describtion,
          style: AppTextStyles.font13Regular.copyWith(color: AppColors.darkGray),
        ),
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (_) => ExerciseDetailsScreen(exercise: exercise),
        //     ),
        //   );
        // },
      ),
    );
  }
}

class FoodItem {
  final String title;
  final String describtion;
  final String image;

  FoodItem(this.title, this.describtion, this.image);
}
