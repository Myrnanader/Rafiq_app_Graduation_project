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
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/password_feild_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;
    final email = data["email"] as String;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go(AppRoutes.passwordChangedScreen);
            }
            if (state is AuthError) {
              CustomSnackBar.show(context, state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  34.h.ph,
                  const CustomAppBar(text: 'Create New Password'),
                  64.h.ph,
                  PasswordField(controller: newPasswordController),
                  24.h.ph,
                  PasswordField(controller: confirmPasswordController),
                  const Spacer(),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Save',
                          onTap: () {
                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              CustomSnackBar.show(
                                  context, "Passwords do not match");
                              return;
                            }

                            context.read<AuthCubit>().resetPassword(
                                  email: email,
                                  newPassword:
                                      newPasswordController.text,
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