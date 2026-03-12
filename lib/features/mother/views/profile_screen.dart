import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../core/routing/app_routes.dart';
import '../widgets/widgets/custom_profile_button.dart';
import '../widgets/widgets/profile_image.dart';
import '../widgets/widgets/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            30.ph,
            ProfileImage(image: 'assets/images/memory.png'),
            10.ph,
            Text(
              'Sara Mohammed',
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
            8.ph,
            Text(
              'Expecting Mother',
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomProfileButton(
                  svgIconPath: 'assets/icons/add_memory.svg',
                  text: 'Add Memory',
                  onPressed: () {
                    context.push(AppRoutes.addMemoryScreen);
                  },
                ),
                const SizedBox(width: 12),
                CustomProfileButton(
                  svgIconPath: 'assets/icons/doc.svg',
                  text: 'Documents',
                  onPressed: () {
                    context.push(AppRoutes.docsScreen);
                  },
                ),
              ],
            ),
            20.ph,
            ProfileInfoCard(
              image: "assets/icons/age.svg",
              title: 'Age',
              value: '25 years Old',
            ),
            const Divider(indent: 20, endIndent: 25),
            ProfileInfoCard(
              image: "assets/icons/pregnant_vector.svg",
              title: 'Current Pregnancy Month',
              value: '3th Month',
            ),
            // const Divider(indent: 20, endIndent: 25),
            // ProfileInfoCard(
            //   image: "assets/icons/id.svg",
            //   title: "Father's Id",
            //   value: '101898567',
            // ),
            50.ph,
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomProfileButton(
                  svgIconPath: 'assets/icons/plus.svg',
                  text: 'Add Baby Profile',
                  onPressed: () {
                    context.push(AppRoutes.babyProfileScreen);
                  },
                ),
                CustomProfileButton(
                  svgIconPath: 'assets/icons/plus.svg',
                  text: 'Add Father\'s Id',
                  onPressed: () {
                    context.push(AppRoutes.addFatherIdScreen);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
