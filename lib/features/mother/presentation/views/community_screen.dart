import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/date_format_helper.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';
import '../cubit/mother_comments_cubit.dart';
import '../cubit/mother_experiences_cubit.dart';
import '../cubit/mother_experiences_state.dart';
import '../cubit/mother_posts_cubit.dart';
import '../cubit/mother_posts_state.dart';

import '../widgets/widgets/custom_post_card.dart';
import '../widgets/widgets/custom_previous_experience_card.dart';

import 'comment_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => CommunityScreenState();
}

class CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool get isPostsTab => _tabController.index == 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsCubit>().getFeed();
      context.read<ExperiencesCubit>().getExperiences();
    });

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.neutralGray,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(child: Text("Posts", style: AppTextStyles.font14SemiBold)),
            Tab(
              child: Text(
                "Previous experience",
                style: AppTextStyles.font14SemiBold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            /// ================= POSTS =================
            BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
                String userName = "Anonymous Mom";

                if (userState is UserLoaded) {
                  final fullName = userState.profile.fullName;
                  if (fullName.trim().isNotEmpty) {
                    userName = fullName;
                  }
                }

                String? userImage;

                if (userState is UserLoaded) {
                  userImage = userState.profile.fullImageUrl;
                }

                return BlocBuilder<PostsCubit, PostsState>(
                  builder: (context, state) {
                    if (state is PostsLoading) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.lavender,));
                    }

                    if (state is PostsError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is PostsLoaded) {
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.posts[index];

                          return BlocBuilder<UserCubit, UserState>(
                            builder: (context, userState) {
                              bool isAdmin = false;

                              if (userState is UserLoaded) {
                                isAdmin = userState.profile.role == "Admin";
                              }
                              return CustomPostCard(
                                id: post.id,
                                userName: userName,
                                userImage:
                                    userImage ?? "assets/images/user.png",
                                date: post.createdAt?.toTimeAgo() ?? "",
                                description: post.contentOrSolution ?? "",
                                postImage: post.fullImageUrl ?? "",
                                likesCount: post.likeCount ?? 0,
                                comments: post.commentCount ?? 0,
                                isLiked: post.isLikedByMe ?? false,
                                isSaved: post.isSavedByMe ?? false,
                                onLike: () => context
                                    .read<PostsCubit>()
                                    .toggleLike(post.id),
                                onSave: () => context
                                    .read<PostsCubit>()
                                    .toggleSave(post.id),
                                onComment: () =>
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (_) => BlocProvider.value(
                                        value: context.read<PostsCubit>(),
                                        child: CommentsSheet(postId: post.id),
                                      ),
                                    ).whenComplete(() {
                                      if (context.mounted) {
                                        context.read<PostsCubit>().getFeed();
                                      }
                                    }),
                                canDelete: true,
                                onDelete: () async {
                                  if (isAdmin) {
                                    await context.read<PostsCubit>().deleteAnyPost(post.id);
                                  } else {
                                    await context.read<PostsCubit>().deleteMyPost(post.id);
                                  }

                                  await context.read<PostsCubit>().getFeed();
                                }, isAdmin: false,
                              );
                            },
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),

            /// ================= EXPERIENCES =================
            BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
                String userName = "Anonymous Mom";

                if (userState is UserLoaded) {
                  final fullName = userState.profile.fullName;
                  if (fullName.trim().isNotEmpty) {
                    userName = fullName;
                  }
                }

                String? userImage;

                if (userState is UserLoaded) {
                  userImage = userState.profile.fullImageUrl;
                }

                return BlocBuilder<ExperiencesCubit, ExperiencesState>(
                  builder: (context, state) {
                    if (state is ExperiencesLoading) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.lavender,));
                    }

                    if (state is ExperiencesError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is ExperiencesLoaded) {
                      final experiences = state.experiences;

                      if (experiences.isEmpty) {
                        return const Center(child: Text("No experiences yet"));
                      }

                      return ListView.builder(
                        itemCount: experiences.length,
                        itemBuilder: (context, index) {
                          final exp = experiences[index];

                          return GestureDetector(
                            onTap: () {
                              context.push(
                                AppRoutes.experienceScreen,
                                extra: exp,
                              );
                            },
                            child: CustomPreviousExperienceCard(
                              id: exp.id,
                              userName: userName,
                              date: exp.createdAt?.toTimeAgo() ?? "",
                              description: exp.type == 2
                                  ? "${exp.titleOrChallenge ?? ''}\n\n${exp.contentOrSolution ?? ''}"
                                  : exp.contentOrSolution ?? "",
                              userImage: userImage,
                              likesCount: exp.likeCount ?? 0,
                              commentsCount: exp.commentCount ?? 0,
                              isLiked: exp.isLikedByMe ?? false,
                              isSaved: exp.isSavedByMe ?? false,

                              onLike: () => context
                                  .read<ExperiencesCubit>()
                                  .toggleLike(exp.id),
                              onSave: () => context
                                  .read<ExperiencesCubit>()
                                  .toggleSave(exp.id),
                              onComment: () =>
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => BlocProvider.value(
                                      value: context.read<PostsCubit>(),
                                      child: CommentsSheet(postId: exp.id),
                                    ),
                                  ).whenComplete(() {
                                    if (context.mounted) {
                                      context
                                          .read<ExperiencesCubit>()
                                          .getExperiences();
                                    }
                                  }),
                            ),
                          );
                        },
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: CircleBorder(),
        onPressed: () {
          if (isPostsTab) {
            context.push(AppRoutes.addPostScreen);
          } else {
            context.push(
              AppRoutes.addExperienceScreen,
              extra: context.read<ExperiencesCubit>(),
            );
          }
        },
        child: const Icon(Icons.add, color: AppColors.lightBackground),
      ),
    );
  }
}

class CommunityWrapper extends StatelessWidget {
  const CommunityWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PostsCubit>()..getFeed()),
        BlocProvider(
          create: (_) => getIt<ExperiencesCubit>()..getExperiences(),
        ),
        BlocProvider(create: (_) => getIt<CommentsCubit>()),
      ],
      child: const CommunityScreen(),
    );
  }
}
