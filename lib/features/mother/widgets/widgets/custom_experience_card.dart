import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';

class CustomExperienceCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const CustomExperienceCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<CustomExperienceCard> createState() => _CustomExperienceCardState();
}

class _CustomExperienceCardState extends State<CustomExperienceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(12),
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.silver, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SvgPicture.asset(
                    widget.image,
                    width: 15,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.lightSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                10.pw,
                Text(
                  widget.title,
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.onBackgroundLight,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.cloudBurst,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
