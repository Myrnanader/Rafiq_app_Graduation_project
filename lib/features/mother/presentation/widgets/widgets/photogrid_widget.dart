import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import 'custom_camera_button.dart';
class PhotoGrid extends StatelessWidget {
  final List<AssetEntity> images;
  final List<AssetEntity> selectedImages;
  final Function(AssetEntity) toggleSelect;

  const PhotoGrid({
    super.key,
    required this.images,
    required this.selectedImages,
    required this.toggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) return const CameraButton();
        AssetEntity image = images[index - 1];
        bool isSelected = selectedImages.contains(image);
        return GestureDetector(
          onTap: () => toggleSelect(image),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AssetEntityImage(
                  image,
                  fit: BoxFit.cover,
                  isOriginal: false,
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 6,
                  right: 6,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.lightSurface,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.lightSurface,
                      child: Text(
                        "${selectedImages.indexOf(image) + 1}",
                        style: AppTextStyles.font11Regular.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
