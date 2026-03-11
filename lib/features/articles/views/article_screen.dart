import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/custom_article_card.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
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
            25.ph,
            Text(
              "Articles",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomArticleCard(
              title: "Morning Sickness: How to Reduce Nausea Naturally",
              description:
                  "Simple daily habits and breathing techniques that help reduce nausea during early pregnancy.",
              postImage: "assets/images/nausea.jpg",
            ),
            CustomArticleCard(
              title: "Safe Yoga Poses During Pregnancy",
              description:
                  "A guide to pregnancy-safe yoga poses for all trimesters and how to practice them correctly.",
              postImage: "assets/images/yoga.jpg",
            ),
            CustomArticleCard(
              title: "Managing Back Pain While Pregnant",
              description:
                  "Learn why back pain happens during pregnancy and practical ways to relieve it safely.",
              postImage: "assets/images/lower-back-pain.jpg",
            ),
            CustomArticleCard(
              title: "The Importance of Pelvic Floor Exercises",
              description:
                  "Why Kegel exercises matter and how they support easier delivery and recovery.",
              postImage: "assets/images/Pelvic-Floor-Exercises.jpg",
            ),
            CustomArticleCard(
              title: "Exercises to Reduce Leg Swelling",
              description:
                  "Gentle movements and tips to improve circulation and reduce swollen ankles.",
              postImage: "assets/images/leg-swelling.jpg",
            ),
            CustomArticleCard(
              title: "Breathing Techniques for Stress Relief",
              description:
                  "Simple breathing exercises to calm anxiety and improve sleep during pregnancy.",
              postImage: "assets/images/breathing.png",
            ),
          ],
        ),
      ),
    );
  }
}
