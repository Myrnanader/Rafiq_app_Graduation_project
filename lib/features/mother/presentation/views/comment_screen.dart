import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';
import '../cubit/mother_comments_cubit.dart';
import '../cubit/mother_comments_state.dart';
import '../widgets/widgets/comment_item.dart';

/// ================= OPEN SHEET =================
class CommentsSheet extends StatelessWidget {
  final String postId;

  const CommentsSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final controller = DraggableScrollableController();

    return BlocProvider(
      create: (_) => getIt<CommentsCubit>()..getComments(postId),
      child: DraggableScrollableSheet(
        controller: controller,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return _CommentsSheet(
            postId: postId,
            scrollController: scrollController,
            sheetController: controller,
          );
        },
      ),
    );
  }
}

/// ================= SHEET =================
class _CommentsSheet extends StatefulWidget {
  final String postId;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;

  const _CommentsSheet({
    required this.postId,
    required this.scrollController,
    required this.sheetController,
  });

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  bool isFull = false;

  @override
  void initState() {
    super.initState();

    context.read<CommentsCubit>().getComments(widget.postId);

    widget.sheetController.addListener(() {
      final size = widget.sheetController.size;

      if (size > 0.8 && !isFull) {
        setState(() => isFull = true);
      } else if (size <= 0.6 && isFull) {
        setState(() => isFull = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(color: AppColors.lightBackground),
      child: Column(
        children: [
          8.ph,

          Row(
            children: [
              const Spacer(),
              80.pw,
              Text(
                "Comments",
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
              const Spacer(),

              TextButton(
                onPressed: () {
                  widget.sheetController.animateTo(
                    isFull ? 0.4 : 0.95,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Text(
                  isFull ? "Hide" : "View all",
                  style: AppTextStyles.font10Regular.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              10.pw,
            ],
          ),

          Expanded(
            child: BlocBuilder<CommentsCubit, CommentsState>(
              buildWhen: (prev, curr) =>
                  curr is CommentsLoading ||
                  curr is CommentsLoaded ||
                  curr is CommentsError,
              builder: (context, state) {
                if (state is CommentsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CommentsError) {
                  return Center(child: Text(state.message));
                }

                if (state is CommentsLoaded) {
                  final comments = state.comments;

                  if (comments.isEmpty) {
                    return const Center(child: Text("No comments yet"));
                  }

                  return BlocBuilder<UserCubit, UserState>(
                    builder: (context, userState) {
                      String userName = "Anonymous Mom";
                      String userImage = "assets/images/user.png";

                      if (userState is UserLoaded) {
                        final fullName = userState.profile.fullName;
                        if (fullName.trim().isNotEmpty) {
                          userName = fullName;
                        }
                      }

                      return ListView.builder(
                        itemCount: state.comments.length,
                        itemBuilder: (context, index) {
                          final comment = state.comments[index];

                          return CommentItem(
                            commentId: comment.id,
                            userImage:
                                (comment.authorImageUrl?.trim().isEmpty ?? true)
                                ? userImage
                                : comment.authorImageUrl!,
                            userName:
                                (comment.authorName?.trim().isEmpty ?? true)
                                ? userName
                                : comment.authorName!,

                            time: comment.timeAgo,
                            comment: comment.content,
                            likes: comment.likeCount,
                            isLiked: comment.isLikedByMe,
                            repliesCount: comment.replies?.length ?? 0,
                            replies: comment.replies,
                            canDelete: true,
                            onDelete: () async {
                              final userState = context.read<UserCubit>().state;

                              final isAdmin =
                                  userState is UserLoaded &&
                                  userState.profile.role.toLowerCase() ==
                                      "admin";

                              if (isAdmin) {
                                await context
                                    .read<CommentsCubit>()
                                    .deleteAnyComment(
                                      postId: widget.postId,
                                      commentId: comment.id,
                                    );
                              } else {
                                await context
                                    .read<CommentsCubit>()
                                    .deleteMyComment(
                                      postId: widget.postId,
                                      commentId: comment.id,
                                    );
                              }
                            },
                          );
                        },
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),

          /// INPUT
          _CommentInput(postId: widget.postId),
        ],
      ),
    );
  }
}

/// ================= INPUT =================
class _CommentInput extends StatefulWidget {
  final String postId;

  const _CommentInput({required this.postId});

  @override
  State<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<_CommentInput> {
  final controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(0),
        border: Border(top: BorderSide(color: AppColors.primary, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5.0,
            spreadRadius: 0.1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Colors.white),
          10.pw,

          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Write your comment...',
                  hintStyle: AppTextStyles.font10Regular.copyWith(
                    color: AppColors.neutralGray,
                  ),
                  filled: true,
                  fillColor: AppColors.lightBackground,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.silver, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.silver, width: 1.5),
                  ),
                ),
              ),
            ),
          ),

          IconButton(
            icon: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  )
                : const Icon(Icons.send, color: AppColors.primary),
            onPressed: () async {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              setState(() => isLoading = true);

              await context.read<CommentsCubit>().addComment(
                postId: widget.postId,
                content: text,
              );

              controller.clear();

              setState(() => isLoading = false);
            },
          ),
        ],
      ),
    );
  }
}

/// ================= REPLY DIALOG =================
void _showReplyDialog(BuildContext context, String postId, String commentId) {
  final controller = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: AppColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Reply",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                "Write your reply to this comment",
                style: TextStyle(fontSize: 12, color: AppColors.darkGray),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: controller,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Write reply...",
                  filled: true,
                  fillColor: AppColors.lightSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ),

                  20.pw,

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final text = controller.text.trim();

                        if (text.isEmpty) return;

                        await context.read<CommentsCubit>().addComment(
                          postId: postId,
                          content: text,
                          parentCommentId: commentId,
                        );

                        Navigator.of(dialogContext).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Send',
                        style: TextStyle(color: AppColors.lightBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// =====================================================================
/// ================= STATIC COMMENTS (FOR DEMO POSTS) =================
/// =====================================================================

class _StaticReply {
  final String userName;
  final String userImage;
  final String time;
  final String comment;
  final int likes;
  final bool isLiked;

  const _StaticReply({
    required this.userName,
    required this.userImage,
    required this.time,
    required this.comment,
    this.likes = 0,
    this.isLiked = false,
  });
}

class _StaticComment {
  final String userName;
  final String userImage;
  final String time;
  final String comment;
  final int likes;
  final bool isLiked;
  final List<_StaticReply> replies;

  const _StaticComment({
    required this.userName,
    required this.time,
    required this.comment,
    this.likes = 0,
    this.isLiked = false,
    this.replies = const [],
    required this.userImage,
  });
}

class StaticCommentsSheet extends StatefulWidget {
  final List<_StaticComment>? comments;

  const StaticCommentsSheet({super.key, this.comments});

  static const _defaultComments = <_StaticComment>[
    _StaticComment(
      userName: "Mona Hassan",
      userImage: "assets/images/sky1.jpg",
      time: "30m",
      comment: "Totally normal at this age, it gets better I promise ❤️",
      likes: 5,
      isLiked: false,
      replies: [
        _StaticReply(
          userName: "Noha Ahmed",
          userImage: "assets/images/cat.jpg",
          time: "20m",
          comment: "Thank you, I really needed to hear that today 🤍",
          likes: 2,
          isLiked: true,
        ),
      ],
    ),
    _StaticComment(
      userName: "Sara Adel",
      userImage: "assets/images/butterfly.jpg",
      time: "35m",
      comment: "Try a white-noise machine, it worked wonders for us!",
      likes: 3,
      isLiked: true,
      replies: [
        _StaticReply(
          userName: "Noha Ahmed",
          userImage: "assets/images/sky1.jpg",
          time: "20m",
          comment: "Ooh which one did you use? Will order one tonight",
          likes: 0,
          isLiked: false,
        ),
        _StaticReply(
          userName: "Sara Adel",
          userImage: "assets/images/cat.jpg",
          time: "10m",
          comment: "I used the Hatch one, highly recommend it!",
          likes: 1,
          isLiked: false,
        ),
      ],
    ),
    _StaticComment(
      userName: "Yasmin Tarek",
      userImage: "assets/images/flower.jpg",
      time: "40m",
      comment: "Sending you a big hug, you're doing an amazing job 🤍",
      likes: 8,
      isLiked: false,
      replies: [
        _StaticReply(
          userName: "Noha Ahmed",
          userImage: "assets/images/cat.jpg",
          time: "20m",
          comment: "Thank you, You are so sweet 🤍",
          likes: 2,
          isLiked: true,
        ),
      ],
    ),
  ];

  @override
  State<StaticCommentsSheet> createState() => _StaticCommentsSheetState();
}

class _StaticCommentsSheetState extends State<StaticCommentsSheet> {
  late final DraggableScrollableController _sheetController;
  bool isFull = false;

  @override
  void initState() {
    super.initState();
    _sheetController = DraggableScrollableController();
    _sheetController.addListener(() {
      final size = _sheetController.size;
      if (size > 0.8 && !isFull) {
        setState(() => isFull = true);
      } else if (size <= 0.6 && isFull) {
        setState(() => isFull = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final comments = widget.comments ?? StaticCommentsSheet._defaultComments;

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(color: AppColors.lightBackground),
          child: Column(
            children: [
              8.ph,

              Row(
                children: [
                  const Spacer(),
                  80.pw,
                  Text(
                    "Comments",
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      _sheetController.animateTo(
                        isFull ? 0.4 : 0.95,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Text(
                      isFull ? "Hide" : "View all",
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ),
                  10.pw,
                ],
              ),

              Expanded(
                child: comments.isEmpty
                    ? const Center(child: Text("No comments yet"))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final c = comments[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommentItem(
                                commentId: 'static_$index',
                                userName: c.userName,
                                userImage: c.userImage,
                                time: c.time,
                                comment: c.comment,
                                likes: c.likes,
                                isLiked: c.isLiked,
                                repliesCount: 0,
                                replies: const [],
                                canDelete: false,
                              ),
                              if (c.replies.isNotEmpty)
                                _StaticReplies(replies: c.replies),
                            ],
                          );
                        },
                      ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(0),
                  border: Border(
                    top: BorderSide(color: AppColors.primary, width: 1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5.0,
                      spreadRadius: 0.1,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/sky1.jpg"),
                    ),
                    10.pw,

                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          // controller: controller,
                          decoration: InputDecoration(
                            hintText: 'Write your comment...',
                            hintStyle: AppTextStyles.font10Regular.copyWith(
                              color: AppColors.neutralGray,
                            ),
                            filled: true,
                            fillColor: AppColors.lightBackground,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: AppColors.silver,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: AppColors.silver,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.primary),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// ================= STATIC REPLIES (expand/collapse) =================
class _StaticReplies extends StatefulWidget {
  final List<_StaticReply> replies;

  const _StaticReplies({required this.replies});

  @override
  State<_StaticReplies> createState() => _StaticRepliesState();
}

class _StaticRepliesState extends State<_StaticReplies> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 52, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                expanded
                    ? "Hide replies"
                    : "View ${widget.replies.length} ${widget.replies.length == 1 ? 'reply' : 'replies'}",
                style: AppTextStyles.font10Regular.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (expanded)
            ...widget.replies.map((r) => _StaticReplyTile(reply: r)),
        ],
      ),
    );
  }
}

class _StaticReplyTile extends StatelessWidget {
  final _StaticReply reply;

  const _StaticReplyTile({required this.reply});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: .5),
            ),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(reply.userImage),
            ),
          ),
          8.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reply.userName,
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.onPrimaryFixed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    6.pw,
                    Text(
                      reply.time,
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ],
                ),
                4.ph,
                Text(
                  reply.comment,
                  style: AppTextStyles.font10Regular.copyWith(
                    color: AppColors.onPrimaryFixed,
                  ),
                ),
                4.ph,
                Row(
                  children: [
                    Icon(
                      reply.isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 13,
                      color: reply.isLiked
                          ? AppColors.primary
                          : AppColors.neutralGray,
                    ),
                    4.pw,
                    Text(
                      '${reply.likes}',
                      style: AppTextStyles.font10Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
