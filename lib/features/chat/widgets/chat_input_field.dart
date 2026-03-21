import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// TEXT FIELD
        Expanded(
          child: TextField(
            controller: controller,
            style: AppTextStyles.font13Medium,
            decoration: InputDecoration(
              hintText: "Type a message...",
              hintStyle: AppTextStyles.font12Regular.copyWith(
                color: AppColors.onPrimary.withValues(alpha: .7),
              ),

              suffixIcon: Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  AppImages.mic,
                  width: 20.w,
                  height: 20.w,
                  color: AppColors.primary,
                ),
              ),

              filled: true,
              fillColor: Colors.white.withValues(alpha: .6),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.onPrimary, width: 1.5),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.onPrimary, width: 1.5),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.onPrimary, width: 1.5),
              ),
            ),
          ),
        ),

        11.w.horizontalSpace,

        /// SEND BUTTON
        GestureDetector(
          onTap: onSend,
          child: Container(
            width: 44.w,
            height: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.onPrimary,
            ),
            child: Center(
              child: Image.asset(AppImages.send, width: 20.w, height: 20.w),
            ),
          ),
        ),
      ],
    );
  }
}
