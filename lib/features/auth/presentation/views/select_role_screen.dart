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
    return Scaffold(
      body: Padding(
<<<<<<< HEAD
        padding: EdgeInsets.symmetric(horizontal: 22.w),
=======
        padding: EdgeInsets.symmetric(horizontal: 24.w),
>>>>>>> origin/development
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            34.h.ph,
            const CustomAppBar(
              text: 'Select Your Role',
              backRoute: AppRoutes.signInScreen,
            ),
            152.h.ph,
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextCard(
                  label: 'Parents',
                  imagePath: AppImages.family,
                  isSelected: selectedRole == 'parents',
                  onTap: () {
                    setState(() {
                      selectedRole = 'parents';
                    });
                  },
                ),
                IconTextCard(
                  label: 'Doctor',
                  imagePath: AppImages.stethoscope,
                  isSelected: selectedRole == 'doctor',
                  onTap: () {
                    setState(() {
                      selectedRole = 'doctor';
                    });
                  },
                ),
              ],
            ),
            34.h.ph,
            Text(
              'We ask this to offer you a morepersonalized journey',
              style: AppTextStyles.font14Regular.copyWith(color: AppColors.darkGray),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onTap: () {
                if (selectedRole.isNotEmpty) {
                  if (selectedRole == 'parents') {
                    context.go(AppRoutes.chooseParentTypeScreen);
                  } else if (selectedRole == 'doctor') {
                    context.go(AppRoutes.doctorInformationScreen);
                  }
                } else {
                  CustomSnackBar.show(context, 'Please select a role');
                }
              },
            ),
            56.h.ph,
          ],
        ),
      ),
    );
  }
}
