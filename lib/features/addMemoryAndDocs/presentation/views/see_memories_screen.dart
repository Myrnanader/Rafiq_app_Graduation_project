import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/helpers/date_format_helper.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../../core/common/widgets/custom_app_images.dart';
import '../../../../core/helpers/extensions.dart';
import '../../data/models/memory_model.dart';
import '../widgets/widgets/custom_see_memory_card.dart';

class SeeMemoriesScreen extends StatelessWidget {
  final MemoryModel memory;

  const SeeMemoriesScreen({super.key, required this.memory});

  @override
  Widget build(BuildContext context) {
    String imagePath =
    CustomAppImages.getImage(memory.title);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Column(
          children: [
            5.ph,
            IconButton(
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
          ],
        ),
        title: Column(
          children: [
            25.ph,
            Text(
              memory.title,
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          40.ph,
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                // memory.fullImageUrl != null
                //     ?
                Image.asset(
                        // memory.fullImageUrl!,
                  imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const Icon(Icons.broken_image),
                      )
                    // : const Icon(Icons.image),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: CustomSeeMemoryCard(
                title: memory.title,
                date: memory.date?.toTimeAgo() ?? "No date",
                description: memory.description ?? "No Description",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
