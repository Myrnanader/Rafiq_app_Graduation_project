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

                      final isAdmin = userState is UserLoaded &&
                          userState.profile.role == "Admin";

                      return BlocBuilder<UserCubit, UserState>(
                        builder: (context, userState) {

                          String userName = "Anonymous Mom";

                          if (userState is UserLoaded) {
                            final fullName = userState.profile.fullName;
                            if (fullName.trim().isNotEmpty) {
                              userName = fullName;
                            }
                          }

                          return BlocBuilder<CommentsCubit, CommentsState>(
                            builder: (context, state) {
                              if (state is CommentsLoaded) {

                                return ListView.builder(
                                  itemCount: state.comments.length,
                                  itemBuilder: (context, index) {
                                    final comment = state.comments[index];

                                    return CommentItem(
                                      commentId: comment.id,

                                      userName: (comment.authorName?.trim().isEmpty ?? true)
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

                                          final isAdmin = userState is UserLoaded &&
                                              userState.profile.role.toLowerCase() == "admin";

                                          if (isAdmin) {
                                            await context.read<CommentsCubit>().deleteAnyComment(
                                              postId: widget.postId,
                                              commentId: comment.id,
                                            );
                                          } else {
                                            await context.read<CommentsCubit>().deleteMyComment(
                                              postId: widget.postId,
                                              commentId: comment.id,
                                            );
                                          }
                                        }                                    );
                                  },
                                );
                              }

                              return const SizedBox();
                            },
                          );
                        },
                      );                    },
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
