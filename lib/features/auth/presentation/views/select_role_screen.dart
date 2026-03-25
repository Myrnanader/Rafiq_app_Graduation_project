import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/features/auth/data/models/auth_register_data.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_role_card_widget.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String selectedRole = "";

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as AuthRegisterData;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                34.h.ph,
                const CustomAppBar(
                  text: 'Choose Parent Type',
                  backRoute: AppRoutes.signUpScreen,
                ),
                120.h.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextCard(
                      label: 'Mother',
                      imagePath: AppImages.pregnantWoman,
                      isSelected: selectedRole == 'mother',
                      onTap: () => setState(() => selectedRole = 'mother'),
                    ),
                    IconTextCard(
                      label: 'Father',
                      imagePath: AppImages.father,
                      isSelected: selectedRole == 'father',
                      onTap: () => setState(() => selectedRole = 'father'),
                    ),
                  ],
                ),
                34.h.ph,
                Text(
                  'To give you a customized experience, we need to know your role',
                  style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.darkGray),
                  textAlign: TextAlign.center,
                ),
                120.h.ph,
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                    if (selectedRole.isEmpty) {
                      CustomSnackBar.show(context, 'Please select a role');
                      return;
                    }
                    data.role = selectedRole;
                    data.profileType = selectedRole == 'mother'
                        ? "MotherProfile"
                        : "FatherProfile";
                    context.go(
                      AppRoutes.motherInformationScreen,
                      extra: data,
                    );
                  },
                ),
                56.h.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}