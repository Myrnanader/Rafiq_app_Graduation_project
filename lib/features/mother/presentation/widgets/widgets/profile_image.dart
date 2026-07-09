import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/app_colors.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final VoidCallback onCameraTap;

  const ProfileImage({
    super.key,
    required this.image,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
              child: image.startsWith('http')
                ? Image.network(
              image,
              width: 95,
              height: 95,
              fit: BoxFit.cover,
            )
                : Image.asset(
              image,
              width: 95,
              height: 95,
              fit: BoxFit.cover,
            ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}