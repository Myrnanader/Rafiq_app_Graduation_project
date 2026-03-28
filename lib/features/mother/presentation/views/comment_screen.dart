import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/widgets/comment_item.dart';

void openCommentsSheet(BuildContext context) {
  final controller = DraggableScrollableController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        controller: controller,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return _CommentsSheet(
            scrollController: scrollController,
            sheetController: controller,
          );
        },
      );
    },
  );
}

class _CommentsSheet extends StatefulWidget {
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;

  const _CommentsSheet({
    required this.scrollController,
    required this.sheetController,
  });

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  bool isFull = false;
  Map<int, bool> showRepliesMap = {};

  @override
  void initState() {
    super.initState();

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              80.pw,
              Center(
                child: Text(
                  "Comments",
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.onPrimaryFixed,
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  widget.sheetController.animateTo(
                    isFull ? 0.4 : 0.95,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Text(
                  isFull ? "Hidden all" : "View all",
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
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                bool showReplies = showRepliesMap[index] ?? false;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommentItem(
                      userName: "Menna Mohammed",
                      time: "1w",
                      comment:
                          "This helped me a lot during my second trimester",
                      likes: 10,
                    repliesCount: 2,
                      onReply: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Reply tapped"),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: "Write your reply...",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Send"),
                              ),
                            ],
                          ),
                        );
                      },
                      onShowReplies: () {
                        setState(() {
                          showRepliesMap[index] =
                              !(showRepliesMap[index] ?? false);
                        });
                      },
                    ),
                    if (showReplies)
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          children: List.generate(3, (replyIndex) {
                            return CommentItem(
                              userName: "Reply User $replyIndex",
                              time: "${replyIndex + 1}d",
                              comment: "This is reply number $replyIndex",
                              likes: replyIndex * 2,
                              onReply: () {
                              },
                              onShowReplies: () {},
                                repliesCount: 2
                            );
                          }),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          _CommentInput(),
        ],
      ),
    );
  }
}

class _CommentInput extends StatelessWidget {
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
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(),
          10.pw,
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write your comment here...',
                  hintStyle:
                    AppTextStyles.font10Regular.copyWith(
                      color: AppColors.neutralGray,),
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
        ],
      ),
    );
  }
}
