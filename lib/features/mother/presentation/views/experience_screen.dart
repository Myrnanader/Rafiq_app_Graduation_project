import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/date_format_helper.dart';
import '../../data/models/post_model.dart';
import '../widgets/widgets/custom_experience_card.dart';
import '../widgets/widgets/custom_experience_info_card.dart';


class ExperienceScreen extends StatelessWidget {
  final PostModel post;

  const ExperienceScreen({super.key, required this.post});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            width: 20,
            height: 20,
          ),
        ),
        title: Text(
          "Experience",
          style: AppTextStyles.font20SemiBold,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: ListView(
          children: [
            CustomExperienceInfoCard(
              userImage: post.fullImageUrl ?? 'assets/images/user.png',
              userName: post.authorName ?? "Anonymous",
              date: post.createdAt?.toTimeAgo() ?? "",
              description: "Mother",
            ),

            CustomExperienceCard(
              image: 'assets/icons/challenge.svg',
              title: 'The Challenge',
              description: post.titleOrChallenge ?? "No challenge provided",
            ),

            CustomExperienceCard(
              image: 'assets/icons/solution.svg',
              title: 'The Solution',
              description: post.contentOrSolution ?? "No solution provided",
            ),
          ],
        ),
      ),
    );
  }
}
