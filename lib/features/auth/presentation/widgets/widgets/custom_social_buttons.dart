
import 'package:flutter/material.dart';
import 'package:rafiq_app/core/utils/app_icons.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_icon_button.dart';

class CustomSocialLoginIcons extends StatelessWidget {
  const CustomSocialLoginIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButtonWidget(onTap: () {}, iconPath: AppIcons.facebookSvgIcon),
        CustomIconButtonWidget(onTap: () {}, iconPath: AppIcons.googleSvgIcon),
        CustomIconButtonWidget(onTap: () {}, iconPath: AppIcons.appleSvgIcon),
      ],
    );
  }
}
