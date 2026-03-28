import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';

class CustomProfileButton extends StatelessWidget {
  final String svgIconPath;
  final String text;
  final VoidCallback onPressed;

  const CustomProfileButton({
    super.key,
    required this.svgIconPath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        svgIconPath,
        width: 20,
        height: 20,
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      ),
      label: Text(
        text,
        style: AppTextStyles.font14Regular.copyWith(
          color: AppColors.primary,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        backgroundColor: AppColors.lightSurface,
      ),
    );
  }
}
