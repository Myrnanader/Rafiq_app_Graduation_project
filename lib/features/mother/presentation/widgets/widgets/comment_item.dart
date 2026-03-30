import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';

class CommentItem extends StatefulWidget {
  final String userName;
  final String time;
  final String comment;
  final int repliesCount;
  final int likes;
  final VoidCallback? onReply;
  final VoidCallback? onShowReplies;

  const CommentItem({
    super.key,
    required this.userName,
    required this.time,
    required this.comment,
    required this.likes,
    required this.repliesCount,
    this.onReply,
    this.onShowReplies,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool showRepliesText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 18),
          10.pw,
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.userName,
                      style: AppTextStyles.font12Medium.copyWith(
                        color: AppColors.onPrimaryFixed,
                      ),
                    ),
                    8.pw,
                    Text(
                      widget.time,
                      style: AppTextStyles.font8Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.comment,
                  style: AppTextStyles.font10Regular.copyWith(
                    color: AppColors.onPrimaryFixed,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onReply,
                  child: Text(
                    "Reply",
                    style: AppTextStyles.font10Regular.copyWith(
                      color: AppColors.neutralGray,
                    ),
                  ),
                ),
                if (showRepliesText && widget.onShowReplies != null)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showRepliesText = false;
                      });
                      widget.onShowReplies?.call();
                    },
                    child: Text(
                      "\t Show ${widget.repliesCount} replies",
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Column(
            spacing: 4,
            children: [
              18.ph,
              SvgPicture.asset(
                "assets/icons/heart.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                widget.likes.toString(),
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
