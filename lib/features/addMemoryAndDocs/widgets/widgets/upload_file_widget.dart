import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class UploadFileWidget extends StatelessWidget {
  const UploadFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey,
      strokeWidth: 1.5,
      dashPattern: [10, 10],
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          15.ph,
          Image.asset(
            "assets/images/upload.png",
            width: 80,
            height: 85,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose a file",
                textAlign: TextAlign.center,
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                "(jpeg, png, pdf)",
                textAlign: TextAlign.center,
                style: AppTextStyles.font11SemiBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                context.push(
                  AppRoutes.addDocScreen,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 25,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Upload',
                style: AppTextStyles.font9Medium.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),
          10.ph,
        ],
      ),
    );
  }
}
