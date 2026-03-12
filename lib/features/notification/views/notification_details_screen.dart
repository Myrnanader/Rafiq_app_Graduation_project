import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  final bool isEmpty = false;
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
        title: Column(
          children: [
            25.ph,
            Text(
              "Emotional Health Alert",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Card(
        elevation: 1,
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 100, top: 30),
        color: AppColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/icons/stress.svg',
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        colorFilter: ColorFilter.mode(
                          AppColors.lightBackground,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  15.pw,
                  Text(
                    "Emotional Health Alert",
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.midNight,
                    ),
                  ),
                ],
              ),
              10.ph,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Youssef,\nBased on the answers you provided, it seems that you may be experiencing feelings of sadness and pressure after childbirth, which is completely normal and happens to many mothers.\n\nThe most important thing right now is that you are not alone, and with rest and support, things can get better.\n\n• Allow yourself to talk and express your feelings.\n• Ask for help and give yourself time to recover.\n• Use the app to receive daily advice and continuous support.\n• With time, you will be able to reduce this pressure and start feeling better.",
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
