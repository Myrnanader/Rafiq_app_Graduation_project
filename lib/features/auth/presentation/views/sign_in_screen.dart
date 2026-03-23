import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';

import '../../data/repository/auth_repository.dart';
import '../widgets/widgets/custom_or_login_widget.dart';
import '../widgets/widgets/custom_outh_footer.dart';
import '../widgets/widgets/custom_social_buttons.dart';
import '../widgets/widgets/email_feild_widget.dart';
import '../widgets/widgets/header_widget.dart';
import '../widgets/widgets/password_feild_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(
        AuthRepository(getIt()),
        getIt(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.go(AppRoutes.mainNavigationBarScreen);
              }

              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              void submit() {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                }
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 22.w, vertical: 40.h),
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

                        state is AuthLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
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
              );
            },
          ),
        ),
      ),
    );
  }
}