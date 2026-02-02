import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';
import '../widgets/widgets/custom_doc_card.dart';
import '../widgets/widgets/custom_see_doc_card.dart';
import '../widgets/widgets/custom_see_memory_card.dart';
import '../widgets/widgets/doc_item.dart';
import '../widgets/widgets/memory_item.dart';

class SeeDocsScreen extends StatelessWidget {
  final DocItem doc;

  const SeeDocsScreen({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
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
              doc.title,
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
              decoration: BoxDecoration(color: AppColors.lightSurface),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/food.png",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: CustomDocCard(
                image: doc.image,
                title: doc.title,
                description: doc.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
