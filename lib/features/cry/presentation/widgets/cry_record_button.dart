import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class CryRecordButton extends StatelessWidget {
  final VoidCallback onTap;

  /// لو شغال بيعرض animation مختلفة
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isRecording ? Colors.red : AppColors.onPrimary,
          boxShadow: isRecording
              ? [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ]
              : [],
        ),
        child: isRecording
            ? Icon(Icons.stop_rounded, color: Colors.white, size: 32.sp)
            : Image.asset(
                AppImages.mic,
                width: 18.sp,
                height: 20.sp,
              ),
      ),
    );
  }
}