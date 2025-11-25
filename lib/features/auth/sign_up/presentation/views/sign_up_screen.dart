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
import 'package:rafiq_app/features/auth/Custom_presentations/view/widgets/password_feild_widget.dart';

import 'package:rafiq_app/features/auth/sign_up/presentation/widgets/date_of_birth_feild.dart';
import 'package:rafiq_app/features/auth/sign_up/presentation/widgets/full_name_feild.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final dateController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void submit() {
  if (formKey.currentState?.validate() ?? false) {
    context.go(AppRoutes.selectRoleScreen);
  }
}

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  12.h.ph,
                  Text(
                    'Sign Up',
                    style: AppTextStyles.font24SemiBold.copyWith(
                      color: AppColors.onBackgroundLight,
                    ),
                  ),
                  8.h.ph,
                  Text(
                    'Create your account',
                    style: AppTextStyles.font14Medium.copyWith(
                      color: AppColors.lightAppColors,
                    ),
                  ),
                  39.h.ph,
                  FullNameField(controller: fullNameController),
                  16.h.ph,
                  EmailField(controller: emailController),
                  16.h.ph,
                  PasswordField(controller: passwordController),
                  16.h.ph,
                  PasswordField(controller: confirmPasswordController),
                  16.h.ph,
                  DateOfBirthField(controller: dateController),
                  16.h.ph,
                  CustomButton(
                    text: 'Sign Up',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                    onTap: submit,
                    color: AppColors.onPrimary,
                    borderColor: AppColors.onPrimary,
                  ),
                  12.h.ph,
                  const CustomOrLoginWidget(),
                  16.h.ph,
                  const CustomSocialLoginIcons(),
                  24.h.ph,
                  CustomAuthFooter(
                    questionText: "Already have an account?",
                    actionText: "Sign In",
                    route: AppRoutes.signInScreen,
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
