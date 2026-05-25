import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/comment_model.dart';
import '../../cubit/mother_comments_cubit.dart';

class CommentItem extends StatefulWidget {
  final String commentId;
  final bool isLiked;
  final String userName;
  final String time;
  final String comment;
  final int repliesCount;
  final int likes;
  final List<CommentModel>? replies;
  final VoidCallback? onReply;
  final VoidCallback? onShowReplies;
  final bool canDelete;
  final VoidCallback? onDelete;

  const CommentItem({
    super.key,
    required this.commentId,
    required this.userName,
    required this.time,
    required this.comment,
    required this.likes,
    required this.repliesCount,
    required this.isLiked,
    required this.replies,
    this.onReply,
    this.onShowReplies,
    required this.canDelete,
    this.onDelete,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool showRepliesText = true;

  late int likesCount;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    likesCount = widget.likes;
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: .5),
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
            ),
          ),
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

                if (widget.replies != null && widget.replies!.isNotEmpty)
                  Column(
                    children: widget.replies!.map((reply) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 40, top: 8),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: .5,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            8.pw,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reply.authorName ?? "Anonymous",
                                    style: AppTextStyles.font10Regular,
                                  ),
                                  Text(
                                    reply.content,
                                    style: AppTextStyles.font10Regular,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),

          Row(
            children: [
              Column(
                spacing: 4,
                children: [
                  18.ph,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                        likesCount += isLiked ? 1 : -1;
                      });

                      context.read<CommentsCubit>().toggleLike(
                        widget.commentId,
                      );
                    },
                    child: SvgPicture.asset(
                      isLiked
                          ? "assets/icons/solar_heart-bold.svg"
                          : "assets/icons/heart.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        isLiked ? AppColors.primary : AppColors.neutralGray,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  Text(
                    likesCount.toString(),
                    style: AppTextStyles.font12Medium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              10.pw,
              Column(
                spacing: 4,
                children: [
                  12.ph,
                  if (widget.canDelete)
                    PopupMenuButton<String>(
                      color: AppColors.lightBackground,
                      onSelected: (value) {
                        if (value == "delete") {
                          widget.onDelete?.call();
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
                        width: 5,
                        height: 14,
                        colorFilter: ColorFilter.mode(
                          AppColors.neutralGray,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  // if (widget.canDelete)
                  //   PopupMenuButton<String>(
                  //     onSelected: (value) {
                  //       if (value == "delete") {
                  //         widget.onDelete?.call();
                  //       }
                  //     },
                  //     itemBuilder: (_) => const [
                  //       PopupMenuItem(value: "delete", child: Text("Delete")),
                  //     ],
                  //     child: const Icon(Icons.more_vert),
                  //   ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
