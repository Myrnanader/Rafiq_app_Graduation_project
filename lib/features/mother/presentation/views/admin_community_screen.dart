import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/date_format_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

import '../cubit/mother_posts_cubit.dart';
import '../cubit/mother_posts_state.dart';
import '../widgets/widgets/custom_post_card.dart';

class AdminCommunityScreen extends StatefulWidget {
  const AdminCommunityScreen({super.key});

  @override
  State<AdminCommunityScreen> createState() => _AdminCommunityScreenState();
}

class _AdminCommunityScreenState extends State<AdminCommunityScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsCubit>().getPosts(isAdmin: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,

        title: Text(
          "Posts",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostsLoaded) {
            final posts = state.posts;

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return CustomPostCard(
                  id: post.id,
                  userName: post.authorName ?? "Unknown",
                  userImage: post.authorImageUrl ?? "",
                  date: post.createdAt?.toTimeAgo() ?? "",
                  description: post.contentOrSolution ?? "",
                  postImage: post.fullImageUrl ?? "",
                  likesCount: post.likeCount,
                  comments: post.commentCount ?? 0,
                  isLiked: false,
                  isSaved: false,

                  isAdmin: true,
                  onLike: () {},
                  onSave: () {},

                  onComment: () {},

                  canDelete: true,
                  onDelete: () async {
                    await context.read<PostsCubit>().deleteAnyPost(post.id);

                    context.read<PostsCubit>().getPosts(isAdmin: true);
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class AdminCommunityWrapper extends StatelessWidget {
  const AdminCommunityWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<PostsCubit>())],
      child: const AdminCommunityScreen(),
    );
  }
}
