import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isBot;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isBot,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isBot)
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: Image.asset(
              AppImages.chatRobot,
              width: 20.w,
            ),
          ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.all(12.w),
          constraints: BoxConstraints(maxWidth: 230.w),
          decoration: BoxDecoration(
            color: isBot ? Colors.white : AppColors.onPrimary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            message,
            style: AppTextStyles.font12Regular.copyWith(
              color: isBot ? AppColors.onPrimary : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
