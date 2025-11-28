import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  const ProfileImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 112,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary,
          width: 5,
        ),
      ),
      alignment: Alignment.center,
      child: ClipOval(
        child: Image.asset(
          image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
