import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../views/article_details_screen.dart';

class CustomArticleCard extends StatefulWidget {
  final String title;
  final String description;
  final String postImage;

  const CustomArticleCard({
    super.key,
    required this.title,
    required this.description,
    required this.postImage,
  });

  @override
  State<CustomArticleCard> createState() => _CustomArticleCardState();
}

class _CustomArticleCardState extends State<CustomArticleCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleDetailsScreen(
              // title: "Pregnancy yoga",
              // description: "Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation. Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation. Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.\n\nPregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation. Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation. Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.",
              // image: "assets/images/exercise.png",
            ),
          ),
        );
      },
      child: Card(
        shadowColor: const Color(0x50000000),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        color: AppColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.postImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              12.ph,

              Text(
                widget.title,
                style: AppTextStyles.font14Medium.copyWith(
                  color: AppColors.onBackgroundLight,
                ),
              ),

              12.ph,

              Text(
                widget.description,
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.grey,
                ),
              ),
              12.ph,
              Row(
                children: [
                  Text(
                    isSaved? "SAVED FOR LATER" : "SAVE FOR LATER",
                    style: AppTextStyles.font12Medium.copyWith(
                      color: isSaved ? AppColors.primary : AppColors.neutralGray,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    child: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? AppColors.primary : AppColors.neutralGray,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
