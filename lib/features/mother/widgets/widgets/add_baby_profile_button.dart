import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class AddBabyProfileButton extends StatelessWidget {
  const AddBabyProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return           DottedBorder(
      color: Colors.grey,
      strokeWidth: 1.5,
      dashPattern: [10, 10],
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      child: ElevatedButton.icon(
        onPressed: () {
          context.push(AppRoutes.babyProfileScreen);
        },
        icon: Icon(Icons.add, color: Color(0xFF6F42C1)),
        label: Text(
          'Add Baby Profile',
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.primary,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightSurface,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 1),
        ),
      ),
    );
  }
}
