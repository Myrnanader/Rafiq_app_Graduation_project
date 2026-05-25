import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomSeeDocCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const CustomSeeDocCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(20),
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.silver, width: 1),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 📅 DATE FROM API
            Text(
              "Date: $date",
              style: AppTextStyles.font16Regular.copyWith(
                color: AppColors.neutralGray,
              ),
            ),

            const SizedBox(height: 12),

            /// 📝 DESCRIPTION FROM API
            Text(
              "Description:\n$description",
              style: AppTextStyles.font16Regular.copyWith(
                color: AppColors.neutralGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
