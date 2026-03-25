import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/email_feild_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterNeedsVerification) {
              context.push(
                AppRoutes.verifyOtpScreen,
                extra: {
                  "email": emailController.text.trim(),
                  "type": "reset",
                },
              );
            }
            if (state is AuthError) {
              CustomSnackBar.show(context, state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                children: [
                  34.h.ph,
                  const CustomAppBar(
                    text: 'Forget Password',
                    backRoute: AppRoutes.signInScreen,
                  ),
                  50.h.ph,
                  EmailField(controller: emailController),
                  const Spacer(),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Send',
                          onTap: () {
                            context.read<AuthCubit>().forgetPassword(
                                  emailController.text.trim(),
                                );
                          },
                        ),
                  56.h.ph,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}