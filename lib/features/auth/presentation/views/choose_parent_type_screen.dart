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

class ChooseParentTypeScreen extends StatefulWidget {
  const ChooseParentTypeScreen({super.key});

  @override
  State<ChooseParentTypeScreen> createState() => _ChooseParentTypeScreenState();
}

class _ChooseParentTypeScreenState extends State<ChooseParentTypeScreen> {
  String selectedType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            34.h.ph,
            const CustomAppBar(
              text: 'Choose Parent Type',
              backRoute: AppRoutes.selectRoleScreen,
            ),
            152.h.ph,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextCard(
                  label: 'Mother',
                  imagePath: AppImages.pregnantWoman,
                  isSelected: selectedType == 'mother',
                  onTap: () {
                    setState(() {
                      selectedType = 'mother';
                    });
                  },
                ),
                IconTextCard(
                  label: 'Father',
                  imagePath: AppImages.father,
                  isSelected: selectedType == 'father',
                  onTap: () {
                    setState(() {
                      selectedType = 'father';
                    });
                  },
                ),
              ],
            ),
            34.h.ph,
            Text(
              'To give you a customized experience we need to know your gender',
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onTap: () {
                if (selectedType.isNotEmpty) {
                  // في الحالتين Mother أو Father → يروح على نفس الشاشة
                  context.go(AppRoutes.motherInformationScreen);
                } else {
                  CustomSnackBar.show(context, 'Please select a type');
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
