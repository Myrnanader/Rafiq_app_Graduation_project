import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/auth/data/models/auth_register_data.dart';
import 'package:rafiq_app/core/helpers/app_regex.dart';

import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_or_login_widget.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_outh_footer.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_social_buttons.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/email_feild_widget.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/password_feild_widget.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/date_of_birth_feild.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/full_name_feild.dart';

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


    /// 🔥 show error helper
    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    void submit() {
      if (!(formKey.currentState?.validate() ?? false)) return;

      final password = passwordController.text;

      /// 🔥 Password validation (زي الباك)
      if (!AppRegex.hasLowerCase(password)) {
        showError("Password must contain a lowercase letter");
        return;
      }

      if (!AppRegex.hasUpperCase(password)) {
        showError("Password must contain an uppercase letter");
        return;
      }

      if (!AppRegex.hasNumber(password)) {
        showError("Password must contain a number");
        return;
      }

      if (!AppRegex.hasSpecialCharacter(password)) {
        showError("Password must contain a special character");
        return;
      }

      if (!AppRegex.hasMinLength(password)) {
        showError("Password must be at least 8 characters");
        return;
      }

      /// 🔥 date validation
      if (dateController.text.isEmpty) {
        showError("Please select your date of birth");
        return;
      }

      /// ✅ كل حاجة تمام
      final data = AuthRegisterData(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        password: password,
        dateOfBirth: dateController.text.trim(),
      );

      /// 🔥 push مش go
      context.push(AppRoutes.selectRoleScreen, extra: data);
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
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

                  /// Full Name
                  FullNameField(controller: fullNameController),

                  16.h.ph,

                  /// Email
                  EmailField(controller: emailController),

                  16.h.ph,

                  /// Password
                  PasswordField(controller: passwordController),

                  16.h.ph,

                  /// Confirm Password
                  PasswordField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm your password";
                      }
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),

                  16.h.ph,

                  /// Date of Birth
                  DateOfBirthField(controller: dateController),

                  16.h.ph,

                  /// 🔥 Sign Up Button
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