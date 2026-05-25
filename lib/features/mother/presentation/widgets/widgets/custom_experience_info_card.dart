import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../../core/helpers/extensions.dart';

class CustomExperienceInfoCard extends StatefulWidget {
  final String userImage;
  final String userName;
  final String date;
  final String description;

  const CustomExperienceInfoCard({
    super.key,
    required this.userImage,
    required this.userName,
    required this.date,
    required this.description,
  });

  @override
  State<CustomExperienceInfoCard> createState() => _CustomExperienceInfoCardState();
}

class _CustomExperienceInfoCardState extends State<CustomExperienceInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(widget.userImage),
                ),
                15.pw,
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: AppTextStyles.font16Medium.copyWith(color: AppColors.midNight)
                    ),
                    Text(
                      widget.date,
                        style: AppTextStyles.font14Regular.copyWith(color: AppColors.neutralGray)
                    ),
                    Text(
                      widget.description,
                        style: AppTextStyles.font14Regular.copyWith(color: AppColors.neutralGray)                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
