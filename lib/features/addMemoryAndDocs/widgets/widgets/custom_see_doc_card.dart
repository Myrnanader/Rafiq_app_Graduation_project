import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomSeeDocCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String date;

  const CustomSeeDocCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  State<CustomSeeDocCard> createState() => _CustomSeeDocCardState();
}

class _CustomSeeDocCardState extends State<CustomSeeDocCard> {
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
          padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "Date: ${widget.date}",
              "Date: August 22, 2025",
              style: AppTextStyles.font16Regular.copyWith(
                color: AppColors.neutralGray,
              ),
            ),
            Text(
              "Description:\n ${widget.description}",
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
