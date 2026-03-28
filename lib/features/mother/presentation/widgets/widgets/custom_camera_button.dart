import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gainsboro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.camera_alt, color: AppColors.primary, size: 35),
    );
  }
}