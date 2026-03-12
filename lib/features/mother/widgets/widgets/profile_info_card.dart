import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final String image;
  final String value;

  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.image,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              image,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.lightSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            Text(
              value,
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
