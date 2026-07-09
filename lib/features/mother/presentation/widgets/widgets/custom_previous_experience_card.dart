import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';

import '../../../../../core/common/widgets/custom_app_images.dart';

class CustomPreviousExperienceCard extends StatefulWidget {
  final String? id;
  final String userName;
  final String date;
  final String description;
  final String? userImage;

  final int likesCount;
  final int commentsCount;

  final bool isLiked;
  final bool isSaved;

  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onComment;

  const CustomPreviousExperienceCard({
    super.key,
    this.id,
    required this.userName,
    required this.date,
    required this.description,
    this.userImage,
    required this.likesCount,
    required this.commentsCount,
    required this.isLiked,
    required this.isSaved,
    required this.onLike,
    required this.onSave,
    required this.onComment,
  });

  @override
  State<CustomPreviousExperienceCard> createState() =>
      _CustomPreviousExperienceCardState();
}

class _CustomPreviousExperienceCardState
    extends State<CustomPreviousExperienceCard> {
  late bool isLiked;
  late bool oldLiked;
  late bool isSaved;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    oldLiked = isLiked;
    isSaved = widget.isSaved;
  likesCount = widget.likesCount;
  }

  @override
  Widget build(BuildContext context) {
    String imagePath =
    CustomAppImages.getImage(widget.description);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      widget.userImage != null &&
                          widget.userImage!.startsWith("http")
                      ? NetworkImage(widget.userImage!)
                          : AssetImage(widget.userImage!) as ImageProvider,
                  // child:
                  //     (widget.userImage == null ||
                  //         !widget.userImage!.startsWith("http"))
                  //     ? const Icon(Icons.person)
                  //     : null,
                ),

                10.pw,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: AppTextStyles.font16Medium.copyWith(
                        color: AppColors.onPrimaryFixed,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Experience",
                          style: AppTextStyles.font10Regular.copyWith(
                            color: AppColors.neutralGray,
                          ),
                        ),

                        10.pw,

                        Text(
                          widget.date,
                          style: AppTextStyles.font10Regular.copyWith(
                            color: AppColors.neutralGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                /// SAVE
                GestureDetector(
                  onTap: () {
                    setState(() => isSaved = !isSaved);
                    widget.onSave();
                  },
                  child: SvgPicture.asset(
                    "assets/icons/bookmark.svg",
                    width: 20,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSaved ? AppColors.primary : AppColors.neutralGray,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),

            12.ph,

            Text(
              widget.description,
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.neutralGray,
              ),
              maxLines: 3,
            ),

            12.ph,

            Row(
              children: [
                /// LIKE
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                      likesCount += isLiked ? 1 : -1;
                    });
                    widget.onLike();
                  },
                  child: SvgPicture.asset(
                    !isLiked
                        ? "assets/icons/heart.svg"
                        : "assets/icons/solar_heart-bold.svg",
                    width: 20,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      isLiked ? AppColors.primary : AppColors.neutralGray,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                6.pw,

                Text(
                  "$likesCount",
                  style: AppTextStyles.font16Medium.copyWith(
                    color: isLiked ? AppColors.primary : AppColors.neutralGray,
                  ),
                ),

                20.pw,

                /// COMMENTS
                GestureDetector(
                  onTap: widget.onComment,
                  child: SvgPicture.asset(
                    "assets/icons/comments.svg",
                    width: 15,
                    height: 20,
                  ),
                ),

                6.pw,

                Text("${widget.commentsCount}",
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.neutralGray,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
