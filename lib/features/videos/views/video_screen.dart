import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/features/videos/widgets/widgets/custom_video_card.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
              "Video",
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
            CustomVideoCard(
              title: "Exercise During Pregnancy",
              description:
                  "Regular exercise during pregnancy helps improve overall health, reduce back pain, enhance mood, and prepare the body for childbirth. Safe activities such as walking, prenatal yoga, and light stretching can increase energy levels and support healthy weight management when practiced with proper medical guidance.",
              videoPath: "https://youtu.be/HLQGXQhZSR8?si=QIUh3tSCWH8EGBRT",
            ),
            CustomVideoCard(
              title: "Breathing Exercises for Relaxation",
              description:
                  "Calming breathing techniques to reduce stress and improve sleep.",
              videoPath: "https://youtu.be/_PC7pkcS5-U?si=vwZRNLYbVmNPGcg-",
            ),
            CustomVideoCard(
              title: "Morning exercise for Pregnant Women",
              description:
                  "Gentle morning stretches to boost energy and reduce nausea.",
              videoPath: "https://youtu.be/_0LBmiALl1Q?si=rJ4_MAOAlfnyS-_j",
            ),
          ],
        ),
      ),
    );
  }
}
