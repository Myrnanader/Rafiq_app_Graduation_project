import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';

class CustomNotificationCard extends StatefulWidget {
  final String date;
  final String title;
  final String description;
  final String svgPath;

  const CustomNotificationCard({
    super.key,
    required this.date,
    required this.title,
    required this.description,
    required this.svgPath,
  });

  @override
  State<CustomNotificationCard> createState() => _CustomNotificationCardState();
}

class _CustomNotificationCardState extends State<CustomNotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14, left: 2, right: 2),
      shadowColor: const Color(0x50000000),
      elevation: 8,
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.lightBackground),
      ),
      child: ListTile(
        minVerticalPadding: 10,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                widget.svgPath,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),

        title: Text(
          widget.title,
          style: AppTextStyles.font16SemiBold.copyWith(
            color: AppColors.midNight,
          ),
          // maxLines: 1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            1.ph,
            Text(
              widget.description,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.darkGray,
              ),
              maxLines: 1,
            ),
            Text(
              widget.date,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.neutralGray,
              ),
              maxLines: 1,
            ),
          ],
        ),
        onTap: () {
          context.push(AppRoutes.notificationDetailsScreen);
          // GoRouter.of(context).push('/notification-details', extra: {
          //   'title': widget.title,
          //   'description': widget.description,
          //   'date': widget.date,
          //   'svgPath': widget.svgPath,
          // });
        },
      ),
    );
  }
}
