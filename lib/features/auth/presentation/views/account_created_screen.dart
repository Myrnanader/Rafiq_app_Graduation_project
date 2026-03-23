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

class AccountCreatedSuccessfullyScreen extends StatelessWidget {
  const AccountCreatedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              20.h.ph,

              /// 🔥 back بدون route (pop)
              const CustomAppBar(
                text: '',
              ),

              const Spacer(),

              /// ✅ Success Icon
              SvgPicture.asset(
                AppIcons.verify,
                width: 120.w,
                height: 120.h,
              ),

              16.h.ph,

              /// ✅ Title
              Text(
                'Account Created Successfully',
                style: AppTextStyles.font20Medium,
                textAlign: TextAlign.center,
              ),

              8.h.ph,

              /// ✅ Subtext
              Text(
                'Your account has been set up and is ready to use',
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.darkGray,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              /// 🔥 Continue Button
              CustomButton(
                text: 'Continue',
                onTap: () {
                  ///  يروح Home ويقفل كل اللي قبله
                  context.go(AppRoutes.homeScreen);
                },
              ),

              40.h.ph,
            ],
          ),
        ),
      ),
    );
  }
}