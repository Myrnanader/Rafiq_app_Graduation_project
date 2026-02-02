import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import 'memory_item.dart';

class CustomDocCard extends StatefulWidget {
  final String description;
  final String title;
  final String image;

  const CustomDocCard({
    super.key,
    required this.description,
    required this.title,
    required this.image,
  });

  @override
  State<CustomDocCard> createState() => _CustomDocCardState();
}

class _CustomDocCardState extends State<CustomDocCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 14,left: 20, right: 20),
          shadowColor: const Color(0x50000000),
          elevation: 8,
          color: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.lightBackground),
          ),
          child: Row(
            children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.image,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 1,
                  ),
                  title: Text(
                    widget.title,
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.onBackgroundLight,
                    ),
                  ),
                  subtitle: Text(
                    widget.description,
                    style: AppTextStyles.font8Regular.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final doc = MemoryItem(
                  //       title: widget.title,
                  //       date: widget.description,
                  //       image: widget.image,
                  //       description: '“This is the vaccination record of my baby that I uploaded. I wanted to keep everything organized, so I saved a picture of the vaccine he received at the age of [Age in months]. He took the [Vaccine Name], which is a [type of vaccine]. Before we went to theclinic, I was a bit nervous like any mom, but the doctor',
                  //     );
                  //
                  //     context.push(
                  //       AppRoutes.seeMemoriesScreen,
                  //       extra: memory,
                  //     );
                  //   },
                  //
                  //
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColors.primary,
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 1,
                  //       horizontal: 12,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'See the memory',
                  //     style: AppTextStyles.font9Medium.copyWith(
                  //       color: AppColors.lightBackground,
                  //     ),
                  //   ),
                  // ),
                        ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
