import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.width,
    this.textcolor,
    this.isborder = true,
    this.isIcon = false,
    this.hight,
    this.style,
    this.border,
    this.icon,
    this.iconColor,
    this.borderColor,
  });

  final String text;
  final Color? textcolor;
  final Color? color;
  final double? width;
  final void Function()? onTap;
  final bool isborder;
  final bool isIcon;
  final double? hight;
  final TextStyle? style;
  final double? border;
  final IconData? icon;
  final Color? iconColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: hight ?? 56.h,
        decoration: BoxDecoration(
          border: isborder
              ? Border.all(
                  color: borderColor ?? AppColors.onPrimary,
                )
              : null,
          borderRadius: BorderRadius.circular(border ?? 8.r),
          color: color ??  AppColors.onPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isIcon == true) ...[
              Icon(
                icon ?? Icons.arrow_forward_outlined,
                color: iconColor ?? Colors.white,
                size: 18.sp,
              ),
              8.w.pw,
            ],
            Text(
              text,
              style:
                  style ??
                  AppTextStyles.font16Medium.copyWith(
                    color: textcolor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
