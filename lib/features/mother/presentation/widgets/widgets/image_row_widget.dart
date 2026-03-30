import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class ImageRowWidget extends StatelessWidget {
  final List<String> imagePaths;
  final Function(int) onRemove;

  const ImageRowWidget({
    super.key,
    required this.imagePaths,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePaths.isEmpty) {
      return SizedBox(
        height: 300,
      );
    }

    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(File(imagePaths[index])),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => onRemove(index),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.midNight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20, color: AppColors.lightBackground),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
