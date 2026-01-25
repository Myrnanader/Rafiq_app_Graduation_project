import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class CryRecordButton extends StatelessWidget {
  final VoidCallback onTap;
  const CryRecordButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.onPrimary,
        ),
        child: Image.asset(AppImages.mic, width: 18.sp,height: 20.sp,),
      ),
    );
  }
}