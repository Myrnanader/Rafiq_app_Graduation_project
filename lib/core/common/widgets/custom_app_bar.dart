import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.backRoute, //  متغير للـ route اللي هرجع له
  });

  final String text;
  final String backRoute;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {

            context.go(backRoute);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.onPrimaryFixed,
          ),
        ),
        const Spacer(),
        Text(
          text,
          style: AppTextStyles.font24SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        15.w.pw,
        const Spacer(),
      ],
    );
  }
}