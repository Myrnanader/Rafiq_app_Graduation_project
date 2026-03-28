import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';

class SettingsItem extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const SettingsItem({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          svgIconPath,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.lightBackground,
            BlendMode.srcIn,
          ),
        ),      ),
      title: Text(title, style: AppTextStyles.font16Medium.copyWith(color: AppColors.onBackgroundLight)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: AppColors.neutralGray,
      ),
      onTap: onTap,
    );
  }
}
