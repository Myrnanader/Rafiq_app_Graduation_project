import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/features/notification/widgets/widgets/custom_notification_card.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              "Notifications",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: isEmpty
          ? Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/inbox.png",
                      width: 300,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "No notifications yet",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font16SemiBold.copyWith(
                        color: AppColors.onPrimaryFixed,
                      ),
                    ),
                    12.ph,
                    Text(
                      "Your notification will appear here once you've received them.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    120.ph,
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                children: [
                  10.ph,
                  Text(
                    "Recent notifications",
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  10.ph,
                  CustomNotificationCard(
                    date: "3h ago",
                    title: "Emotional Health Alert",
                    description: "Your partner may be going throug....",
                    svgPath: 'assets/icons/stress.svg',
                  ),
                  CustomNotificationCard(
                    date: "5h ago",
                    title: "New Comment",
                    description: "Someone replied to your post.",
                    svgPath: 'assets/icons/Vector.svg',
                  ),
                  CustomNotificationCard(
                    date: "8h ago",
                    title: "Baby Profile Created",
                    description: "Complete your baby's info",
                    svgPath: 'assets/icons/lucide_baby.svg',
                  ),
                  10.ph,
                  Text(
                    "Older notifications",
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  10.ph,
                  CustomNotificationCard(
                    date: "Yesterday",
                    title: "Vaccination Reminder",
                    description: "Your baby's next dose is in 2 days.",
                    svgPath: 'assets/icons/vaccinations.svg',
                  ),
                  CustomNotificationCard(
                    date: "2 days ago",
                    title: "New Comment",
                    description: "Someone replied to your post.",
                    svgPath: 'assets/icons/Vector.svg',
                  ),
                  CustomNotificationCard(
                    date: "3h ago",
                    title: "Vaccination Reminder",
                    description: "Your baby's next dose is in 2 days.",
                    svgPath: 'assets/icons/lucide_baby.svg',
                  ),
                ],
              ),
            ),
    );
  }
}
