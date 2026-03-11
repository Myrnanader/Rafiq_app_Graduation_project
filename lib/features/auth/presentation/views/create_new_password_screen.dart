import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/password_feild_widget.dart';

import '../../../../core/theming/app_colors.dart';

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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              34.h.ph,
              const CustomAppBar(
                text: 'Create New Password',
                backRoute: AppRoutes.verifyOtpScreen,
              ),
              64.h.ph,
              PasswordField(controller: newPasswordController),
              24.h.ph,
              PasswordField(controller: confirmPasswordController),
              329.h.ph,
              CustomButton(
                text: 'Save',
                color: AppColors.primary,
                onTap: () {
                  if (newPasswordController.text ==
                          confirmPasswordController.text &&
                      newPasswordController.text.length >= 6) {
                    context.go(AppRoutes.passwordChangedScreen);
                  } else {
                    CustomSnackBar.show(context, 'Passwords do not match');
                  }
                },
              ),
              56.h.ph,
            ],
          ),
        ),
      ),
    );
  }
}
