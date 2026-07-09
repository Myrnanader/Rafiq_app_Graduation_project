import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../../auth/data/models/profile_response.dart';
import '../widgets/widgets/article_data.dart';
import '../widgets/widgets/custom_article_card.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProfileResponse profileResponse = ProfileResponse();

    final int week = profileResponse.pregnancyWeek == 0
        ? 3
        : profileResponse.pregnancyWeek;

    final articles = weeklyPregnancyArticles[week] ?? [];

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
      body: isLoading
          ? Center(
              child: Lottie.asset(
                "assets/animations/Heart_Loading.json",
                repeat: false,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: articles.map((article) {
                  return CustomArticleCard(
                    title: article["title"],
                    postImage: article["image"],
                    content: article["content"],
                  );
                }).toList(),
              ),
            ),
    );
  }
}
