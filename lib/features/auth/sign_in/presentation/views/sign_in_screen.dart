import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/custom_or_login_widget.dart';
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/custom_outh_footer.dart';
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/custom_social_buttons.dart';
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/email_feild_widget.dart';
import 'package:rafiq_app/features/auth/sign_in/presentation/widgets/header_widget.dart';
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/password_feild_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void submit() {
      if (formKey.currentState?.validate() ?? false) {
        context.go(AppRoutes.verifyOtpScreen);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SignInHeader(),
                  42.h.ph,
                  EmailField(controller: emailController),
                  16.h.ph,
                  PasswordField(controller: passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go(AppRoutes.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forget Password?',
                        style: AppTextStyles.font13Medium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  24.h.ph,
                  CustomButton(
                    text: 'Sign in',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                    onTap: submit,
                    color: AppColors.onPrimary,
                    borderColor: AppColors.onPrimary,
                  ),
                  24.h.ph,
                  const CustomOrLoginWidget(),
                  16.h.ph,
                  const CustomSocialLoginIcons(),
                  32.h.ph,
                  CustomAuthFooter(
                    questionText: "Don't have an account?",
                    actionText: "Sign Up",
                    route: AppRoutes.signUpScreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
