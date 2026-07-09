import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/helpers/date_format_helper.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../../core/common/widgets/custom_app_images.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../data/models/memory_model.dart';

class CustomMemoryCard extends StatelessWidget {
  final MemoryModel memory;
  final VoidCallback onDelete;

  const CustomMemoryCard({
    super.key,
    required this.memory,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath =
    CustomAppImages.getImage(memory.title);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary),
          ),
          child: Text(
            memory.date?.toTimeAgo() ?? "No date",
            style: AppTextStyles.font11Medium.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),

        Card(
          margin: const EdgeInsets.only(bottom: 14, left: 20, right: 20),
          shadowColor: Colors.grey[200],
          elevation: 4,
          color: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColors.lightBackground),
          ),
          child: ListTile(
            onTap: () {
              context.push(AppRoutes.seeMemoriesScreen, extra: memory);
            },
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            title: Text(
              memory.title,
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.midNight,
              ),
              maxLines: 1,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.grey[300]),
              onPressed: onDelete,
            ),
          ),
        ),
      ],
    );
  }
}
