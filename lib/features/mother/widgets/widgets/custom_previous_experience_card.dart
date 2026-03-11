import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../views/comment_screen.dart';

class CustomPreviousExperienceCard extends StatefulWidget {
  final String userName;
  final String date;
  final String description;
  final String userImage;
  final int initialLikes;
  final int comments;

  const CustomPreviousExperienceCard({
    super.key,
    required this.userName,
    required this.date,
    required this.description,
    required this.userImage,
    this.initialLikes = 0,
    this.comments = 0,
  });

  @override
  State<CustomPreviousExperienceCard> createState() =>
      _CustomPreviousExperienceCardState();
}

class _CustomPreviousExperienceCardState
    extends State<CustomPreviousExperienceCard> {
  bool isLiked = false;
  bool isSaved = false;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    likesCount = widget.initialLikes;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.experienceScreen);
      },
      child: Card(
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
                    backgroundColor: AppColors.lightBackground,
                    backgroundImage: AssetImage(widget.userImage),
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
                      Text(
                        widget.date,
                        style: AppTextStyles.font10Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    child: SvgPicture.asset(
                      isSaved ? "assets/icons/bookmark.svg" : "assets/icons/bookmark.svg",
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                        likesCount += isLiked ? 1 : -1;
                      });
                    },
                    child: SvgPicture.asset(
                      !isLiked ? "assets/icons/heart.svg" : "assets/icons/solar_heart-bold.svg",
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
                      color: AppColors.neutralGray,
                    ),
                  ),

                  20.pw,

                  GestureDetector(
                    onTap: () => openCommentsSheet(context),

                    child: SvgPicture.asset(
                      "assets/icons/comments.svg",
                      width: 15,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.neutralGray,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  6.pw,
                  Text(
                    "${widget.comments}",
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.neutralGray,
                    ),
                  ),

                  20.pw,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
