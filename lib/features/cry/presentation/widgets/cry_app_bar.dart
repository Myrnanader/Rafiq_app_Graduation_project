import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/routing/app_routes.dart';

class CryAppBar extends StatelessWidget {
  final String title;
  const CryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 56.h, bottom: 24.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.onPrimaryFixed,
              size: 20.sp,
            ),
            onPressed: () {
              context.push(
                AppRoutes.mainNavigationBarScreen,
              );
            },
          ),

          const Spacer(),
          Text(
            title,
            style: AppTextStyles.font20Medium.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}