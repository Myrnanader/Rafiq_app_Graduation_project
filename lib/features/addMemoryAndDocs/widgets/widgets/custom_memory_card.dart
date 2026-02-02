import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import 'doc_item.dart';
import 'memory_item.dart';

class CustomMemoryCard extends StatefulWidget {
  final String date;
  final String title;
  final String image;

  const CustomMemoryCard({
    super.key,
    required this.date,
    required this.title,
    required this.image,
  });

  @override
  State<CustomMemoryCard> createState() => _CustomMemoryCardState();
}

class _CustomMemoryCardState extends State<CustomMemoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: Text(
            widget.date,
            style: AppTextStyles.font11Medium.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 14, left: 20, right: 20),
          shadowColor: const Color(0x50000000),
          elevation: 8,
          color: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.lightBackground),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            title: Text(
              widget.title,
              style: AppTextStyles.font16Medium.copyWith(
                color: AppColors.midNight,
              ),
              maxLines: 1,
            ),
            trailing:
                // ElevatedButton(
                //   onPressed: () {
                //     final memory = MemoryItem(
                //       title: widget.title,
                //       date: widget.date,
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
    // )
                ElevatedButton(
                  onPressed: () {
                    final doc = DocItem(
                      title: widget.title,
                      date: widget.date,
                      image: widget.image,
                      description:
                          '“This is the vaccination record of my baby that I uploaded. I wanted to keep everything organized, so I saved a picture of the vaccine he received at the age of [Age in months]. He took the [Vaccine Name], which is a [type of vaccine]. Before we went to theclinic, I was a bit nervous like any mom, but the doctor',
                    );

                    context.push(AppRoutes.seeDocsScreen, extra: doc);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'See the memory',
                    style: AppTextStyles.font9Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
