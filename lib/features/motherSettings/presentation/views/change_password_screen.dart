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
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        /// ✅ SUCCESS
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password changed successfully")),
          );

          context.pop();
        }

        /// ❌ ERROR
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

            /// 🔘 Save Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              final currentPass =
                                  currentPasswordController.text;
                              final newPass = newPasswordController.text;
                              final confirm =
                                  confirmPasswordController.text;

                              ///  validation
                              if (currentPass.isEmpty ||
                                  newPass.isEmpty ||
                                  confirm.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "All fields are required"),
                                  ),
                                );
                                return;
                              }

                              if (newPass != confirm) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Passwords do not match"),
                                  ),
                                );
                                return;
                              }

                              ///  CALL API
                              context.read<AuthCubit>().changePassword(
                                    currentPassword: currentPass,
                                    newPassword: newPass,
                                    confirmPassword: confirm,
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: AppTextStyles.font16Medium.copyWith(
                                color: AppColors.lightBackground,
                              ),
                            ),
                          );
                  },
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