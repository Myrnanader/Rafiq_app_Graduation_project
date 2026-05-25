import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/document_model.dart';

class CustomDocCard extends StatelessWidget {
  final DocumentModel document;
  final VoidCallback onDelete;

  const CustomDocCard({
    super.key,
    required this.document,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shadowColor: const Color(0x50000000),
      elevation: 8,
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.lightBackground),
      ),
      child: ListTile(
        onTap: () {
          context.push(AppRoutes.seeDocsScreen, extra: document);
        },
        leading: document.fullImageUrl != null
            ? Image.network(
                document.fullImageUrl!,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              )
            : const Icon(Icons.insert_drive_file),

        title: Text(
          document.title,
          style: AppTextStyles.font16Medium.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),

        subtitle: Text(
          document.description ?? "",
          style: AppTextStyles.font10Regular.copyWith(
            color: AppColors.darkGray,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.grey[200]),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
