
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  const CustomIconButtonWidget({super.key, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 98.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: AppColors.lightAppColors),
          //Color(0xffE8ECF4)
          color: Colors.transparent,
        ),
        child: Center(
          child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
        ),
      ),
    );
  }
}
