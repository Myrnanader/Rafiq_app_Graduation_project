import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_texts/app_text_styles.dart';
import '../../theming/app_colors.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.font14SemiBold.copyWith(
            color: textColor ?? AppColors.onPrimary, 
          ),
        ),
        backgroundColor: backgroundColor ?? AppColors.onSecondary, // ✅ الخلفية secondary
        behavior: SnackBarBehavior.floating,    
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r), //    
        ),
        duration: duration,
      ),
    );
  }

  /// SnackBar للنجاح
  static void success(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Colors.green,
      textColor: AppColors.onPrimary,
    );
  }

  /// SnackBar للخطأ
  static void error(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Colors.red,
      textColor: AppColors.onPrimary,
    );
  }

  /// SnackBar للمعلومات
  static void info(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Colors.blue,
      textColor: AppColors.onPrimary,
    );
  }
}