import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/widgets/custom_app_images.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';

class CustomPostCard extends StatelessWidget {
  final String? id;
  final String userName;
  final String? userImage;
  final String date;
  final String description;
  final String? postImage;
  final int likesCount;
  final int comments;
  final bool isLiked;
  final bool isSaved;

  final bool isAdmin;

  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onComment;

  final bool canDelete;
  final VoidCallback? onDelete;

  const CustomPostCard({
    super.key,
     this.id,
    required this.userName,
    this.userImage,
    required this.date,
    required this.description,
    this.postImage,
    required this.likesCount,
    required this.comments,
    required this.isAdmin,
    required this.isLiked,
    required this.isSaved,
    required this.onLike,
    required this.onSave,
    required this.onComment,
    required this.canDelete,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String firstWord = description.split(' ').first.toLowerCase();

    String imagePath =
    CustomAppImages.getImage(firstWord);

    return Card(
      elevation: 9,
      margin: const EdgeInsets.all(12),
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                  userImage != null
                      ? AssetImage(userImage!)
                      : const AssetImage("assets/images/user.png")
                            as ImageProvider,
                ),
                10.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppTextStyles.font12Medium.copyWith(
                        color: AppColors.onPrimaryFixed,
                      ),
                    ),
                    Text(
                      date,
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                if (canDelete)
                  PopupMenuButton<String>(
                    color: AppColors.lightBackground,
                    onSelected: (value) {
                      if (value == "delete") {
                        onDelete?.call();
                      }
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: "delete",
                        child: Text("Delete"),
                      ),
                    ],
                    child: SvgPicture.asset(
                      "assets/icons/property.svg",
                      width: 10,
                      height: 17,
                      colorFilter: ColorFilter.mode(
                        AppColors.neutralGray,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                10.pw,
              ],
            ),

            12.ph,

            if ((postImage ?? "").isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                // Image.network(
                Image.asset(
                  postImage!,
                  // imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            12.ph,

            if (description.isNotEmpty)
              Text(
                description,
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.neutralGray,
                ),
              ),

            12.ph,

            Row(
              children: [
                  GestureDetector(
                    onTap: onLike,
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
                      color: isLiked
                          ? AppColors.primary
                          : AppColors.neutralGray,
                    ),
                  ),
                  20.pw,

                GestureDetector(
                  onTap: onComment,
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
                  "$comments",
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.neutralGray,
                  ),
                ),

                20.pw,

                if (!isAdmin)
                  GestureDetector(
                    onTap: onSave,
                    child: SvgPicture.asset(
                      isSaved
                          ? "assets/icons/bookmark.svg"
                          : "assets/icons/bookmark.svg",
                      width: 20,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        isSaved ? AppColors.primary : AppColors.neutralGray,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                const Spacer(),

                SvgPicture.asset(
                  "assets/icons/share.svg",
                  width: 15,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.neutralGray,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
