import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_icons.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                34.h.ph,
                CustomAppBar(text: ' ', backRoute: AppRoutes.signInScreen),
                82.h.ph,
                SvgPicture.asset(AppIcons.verify),
                16.h.ph,
                Text(
                  'Password Updated Successfully',
                  style: AppTextStyles.font20Medium,
                  textAlign: TextAlign.center,
                ),
                8.h.ph,
                Text(
                  'Your password has been changed and your account is now secure.',
                  style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.darkGray),
                  textAlign: TextAlign.center,
                ),
                208.h.ph,
                CustomButton(
                  text: 'Continue',
                  onTap: () => context.go(AppRoutes.signInScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}