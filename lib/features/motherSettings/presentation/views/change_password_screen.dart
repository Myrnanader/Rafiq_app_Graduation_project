import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';

import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        ///  نجاح تغيير الباسورد
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password changed successfully")),
          );

          context.pop();
        }

        ///  error
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: AppColors.lightSurface,
          leading: Column(
            children: [
              5.ph,
              IconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.onPrimaryFixed,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Change Password",
            style: AppTextStyles.font20SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    40.ph,

                    /// Current Password
                    CustomInputField(
                      title: 'Current Password',
                      hint: "",
                      controller: currentPasswordController,
                    ),

                    /// New Password
                    CustomInputField(
                      title: 'New Password',
                      hint: "",
                      controller: newPasswordController,
                    ),

                    /// Confirm Password
                    CustomInputField(
                      title: 'Confirm New Password',
                      hint: "",
                      controller: confirmPasswordController,
                    ),
                  ],
                ),
              ),
            ),

            ///  Save Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final newPass = newPasswordController.text;
                    final confirm = confirmPasswordController.text;

                    /// validation
                    if (newPass != confirm) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match"),
                        ),
                      );
                      return;
                    }

                    ///  get email from secure storage
                    final email = await context
                        .read<AuthCubit>()
                        .secureStorage
                        .getEmail();

                    if (email == null || email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Something went wrong, try again"),
                        ),
                      );
                      return;
                    }

                    ///  call API
                    context.read<AuthCubit>().resetPassword(
                          email: email,
                          newPassword: newPass,
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
              ),
            ),

            40.ph,
          ],
        ),
      ),
    );
  }
}