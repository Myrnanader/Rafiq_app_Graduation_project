import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';
import '../widgets/widgets/custom_experience_card.dart';
import '../widgets/widgets/custom_experience_info_card.dart';

class ExperienceScreen extends StatefulWidget {
  final String userName;
  final String date;
  final String description;
  final String userImage;

  const ExperienceScreen({
    super.key,
    required this.userName,
    required this.date,
    required this.description,
    required this.userImage,
  });
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => context.pop(),
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
              "Experience 1",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: ListView(
          children: [
            CustomExperienceInfoCard(
              userImage: 'assets/images/user2.jpg',
              userName: 'Sarah Mohammed',
              date: '34 years old',
              description: '2 kids',
            ),
            CustomExperienceCard(
              image: 'assets/icons/challenge.svg',
              title: 'The Challenge',
              description:
                  "After my second child was born, I struggled with severe sleep deprivation. My youngest would wake up every 2 hours, and my toddler was going through a regression phase. I felt exhausted, overwhelmed, and couldn't function properly during the day. My patience was running thin, and I knew something had to change.",
            ),
            CustomExperienceCard(
              image: 'assets/icons/solution.svg',
              title: 'The Solution',
              description:
                  "started by creating a consistent sleep routine for both of my children. I implemented a calming bedtime schedule that included dim lights, a warm bath, and predictable winding-down activities. I also introduced sleep associations—such as white noise and a comfort object—to help my baby fall back asleep without needing me every time. For my toddler, I focused on gentle sleep training and reassuring him during the regression phase without fully restarting the night-time routine.I asked for support from my partner and allowed myself to rest during the day whenever possible. Over time, the wake-ups became less frequent, my toddler adjusted, and our home slowly returned to a healthier, peaceful rhythm.",
            ),

          ],
        ),
      ),
    );
  }
}
