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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final password = passwordController.text;
    if (!AppRegex.hasLowerCase(password)) {
      _showError("Password must contain a lowercase letter");
      return;
    }
    if (!AppRegex.hasUpperCase(password)) {
      _showError("Password must contain an uppercase letter");
      return;
    }
    if (!AppRegex.hasNumber(password)) {
      _showError("Password must contain a number");
      return;
    }
    if (!AppRegex.hasSpecialCharacter(password)) {
      _showError("Password must contain a special character");
      return;
    }
    if (!AppRegex.hasMinLength(password)) {
      _showError("Password must be at least 8 characters");
      return;
    }
    if (dateController.text.isEmpty) {
      _showError("Please select your date of birth");
      return;
    }
    context.push(
      AppRoutes.selectRoleScreen,
      extra: AuthRegisterData(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        password: password,
        dateOfBirth: dateController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  12.h.ph,
                  Text('Sign Up',
                      style: AppTextStyles.font24SemiBold.copyWith(
                          color: AppColors.onBackgroundLight)),
                  8.h.ph,
                  Text('Create your account',
                      style: AppTextStyles.font14Medium.copyWith(
                          color: AppColors.lightAppColors)),
                  39.h.ph,
                  FullNameField(controller: fullNameController),
                  16.h.ph,
                  EmailField(controller: emailController),
                  16.h.ph,
                  PasswordField(controller: passwordController),
                  16.h.ph,
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
                  DateOfBirthField(controller: dateController),
                  16.h.ph,
                  CustomButton(
                    text: 'Sign Up',
                    style: AppTextStyles.font16Medium.copyWith(
                        color: AppColors.lightBackground),
                    onTap: _submit,
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