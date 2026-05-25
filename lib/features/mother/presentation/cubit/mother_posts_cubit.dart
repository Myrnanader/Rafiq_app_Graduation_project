import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/mother_posts_repository.dart';
import 'mother_posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository repo;

  PostsCubit(this.repo) : super(PostsInitial());

  Future<void> getFeed() async {
    emit(PostsLoading());
    try {
      final data = await repo.getFeed(1);
      emit(PostsLoaded(data));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> getPosts({required bool isAdmin}) async {
    emit(PostsLoading());

    try {
      final data = await repo.getPosts(
        isAdmin: isAdmin,
        page: 1,
      );

      emit(PostsLoaded(data));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> toggleLike(String id) async {
    await repo.toggleLike(id);

    if (state is PostsLoaded) {
      final current = (state as PostsLoaded).posts;

      final updated = current.map((post) {
        if (post.id == id) {
          final newLiked = !post.isLikedByMe;

          return post.copyWith(
            isLikedByMe: newLiked,
            likeCount: post.likeCount + (newLiked ? 1 : -1),
          );
        }
        return post;
      }).toList();


      emit(PostsLoaded(updated));
    }
  }


  Future<void> toggleSave(String id) async {
    await repo.toggleSave(id);

    if (state is PostsLoaded) {
      final current = (state as PostsLoaded).posts;

      final updated = current.map((post) {
        if (post.id == id) {
          return post.copyWith(
            isSavedByMe: !post.isSavedByMe,
          );
        }
        return post;
      }).toList();

      emit(PostsLoaded(updated));
    }
  }


  Future<void> createPost({
    required String content,
    String? imagePath,
  }) async {
    await repo.createPost(
      content: content,
      imagePath: imagePath,
    );

    await getFeed();
  }


  Future<void> deleteMyPost(String postId) async {
    try {
      await repo.deleteMyPost(postId);

      if (state is PostsLoaded) {
        final current = (state as PostsLoaded).posts;

        final updated = current
            .where((post) => post.id != postId)
            .toList();

        emit(PostsLoaded(updated));
      }
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> deleteAnyPost(String postId) async {
    try {
      await repo.deleteAnyPost(postId);

      if (state is PostsLoaded) {
        final current = (state as PostsLoaded).posts;

        final updated = current
            .where((post) => post.id != postId)
            .toList();

        emit(PostsLoaded(updated));
      }
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  void incrementCommentCount(String postId) {
    if (state is! PostsLoaded) return;

    final current = (state as PostsLoaded).posts;

    final updated = current.map((post) {
      if (post.id == postId) {
        return post.copyWith(
          commentCount: (post.commentCount ?? 0) + 1,
        );
      }
      return post;
    }).toList();

    emit(PostsLoaded(updated));
  }

  void decrementCommentCount(String postId) {
    if (state is! PostsLoaded) return;

    final current = (state as PostsLoaded).posts;

    final updated = current.map((post) {
      if (post.id == postId) {
        final currentCount = post.commentCount ?? 0;

        return post.copyWith(
          commentCount: currentCount > 0
              ? currentCount - 1
              : 0,
        );
      }

      return post;
    }).toList();

    emit(PostsLoaded(updated));
  }
}
