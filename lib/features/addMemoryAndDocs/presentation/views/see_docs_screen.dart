import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/helpers/date_format_helper.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/common/widgets/custom_app_images.dart';
import '../../../../core/helpers/extensions.dart';
import '../../data/models/document_model.dart';
import '../widgets/widgets/custom_see_doc_card.dart';

class SeeDocsScreen extends StatelessWidget {
  final DocumentModel doc;

  const SeeDocsScreen({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    String imagePath =
    CustomAppImages.getImage(doc.title);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              AppColors.onPrimaryFixed,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          doc.title,
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          20.ph,

          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.lightSurface,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                // doc.fileUrl != null && doc.fileUrl!.isNotEmpty
                //     ?
                Image.asset(
                  // doc.fullImageUrl!,
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image)),
                )

                    // : const Centerter(child: Icon(Icons.insert_drive_file)),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: CustomSeeDocCard(
                title: doc.title,
                description: doc.description ?? "",
                date: doc.date?.toTimeAgo() ?? "N/A",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
