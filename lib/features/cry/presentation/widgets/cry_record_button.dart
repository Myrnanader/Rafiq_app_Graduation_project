import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class CryRecordButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isRecording;

  const CryRecordButton({
    super.key,
    required this.onTap,
    this.isRecording = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isRecording
              ? Colors.red
              : AppColors.onPrimary,
        ),
        child: Center(
          child: isRecording
              ? Icon(
                  Icons.stop,
                  size: 32.sp,
                  color: Colors.white,
                )
              : Image.asset(
                  AppImages.mic,
                  width: 18.sp,
                  height: 20.sp,
                ),
        ),
      ),
    );
  }
}