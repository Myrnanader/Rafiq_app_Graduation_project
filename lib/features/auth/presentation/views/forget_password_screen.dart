import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
<<<<<<< HEAD
import 'package:rafiq_app/core/theming/app_colors.dart';
=======
>>>>>>> origin/development
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/email_feild_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      body: Padding(
<<<<<<< HEAD
        padding: EdgeInsets.symmetric(horizontal: 22.w),
=======
        padding: EdgeInsets.symmetric(horizontal: 24.w),
>>>>>>> origin/development
        child: SingleChildScrollView(
          child: Column(
            children: [
              34.h.ph,
              const CustomAppBar(
                text: 'Forget Password',
                backRoute: AppRoutes.signInScreen,
              ),
              33.h.ph,
              Image.asset(AppImages.passwordMan),
              8.h.ph,
              EmailField(controller: emailController),
              270.h.ph,
              Padding(
                padding: EdgeInsets.only(bottom: 56.h),
                child: CustomButton(
                  text: 'Send',
<<<<<<< HEAD
                  color: AppColors.primary,
=======
>>>>>>> origin/development
                  onTap: () {
                    context.go(AppRoutes.verifyOtpScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
