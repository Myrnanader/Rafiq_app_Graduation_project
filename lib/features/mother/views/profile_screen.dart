import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/add_baby_profile_button.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/widgets/profile_image.dart';
import '../widgets/widgets/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
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
        title: Column(
          children: [
            25.ph,
            Text(
              "My Profile",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            30.ph,
            ProfileImage(image: 'assets/images/mather1.png'),
            10.ph,
            Text(
              'Sara Mohammed',
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
            Text(
              'Expecting Mother',
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            20.ph,
            ProfileInfoCard(
              image: "assets/icons/age.svg",
              title: 'Age',
              value: '25 years Old',
            ),
            ProfileInfoCard(
              image: "assets/icons/pregnant_vector.svg",
              title: 'Current Pregnancy Month',
              value: '3th Month',
            ),
            ProfileInfoCard(
              image: "assets/icons/id.svg",
              title: "Father's Id",
              value: '101898567',
            ),
            30.ph,
            AddBabyProfileButton(),
            20.ph,
          ],
        ),
      ),
    );
  }
}
