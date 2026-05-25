import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../data/repository/mother_posts_repository.dart';
import 'mother_comments_state.dart';
import 'mother_posts_cubit.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final PostsRepository repo;
  final PostsCubit postsCubit;

  CommentsCubit(
      this.repo,
      this.postsCubit,
      ) : super(CommentsInitial());

  Future<void> getComments(String postId) async {
    emit(CommentsLoading());
    try {
      final res = await repo.getComments(postId);
      emit(CommentsLoaded(res));
    } catch (e) {
      emit(CommentsError(e.toString()));
    }
  }

  Future<void> addComment({
    required String postId,
    required String content,
    String? parentCommentId,
  }) async {
    await repo.addComment(
      postId,
      content,
      parentCommentId: parentCommentId,
    );

    await getComments(postId);

    postsCubit.incrementCommentCount(postId);
  }


  Future<void> toggleLike(String commentId) async {
    if (state is! CommentsLoaded) return;

    final current = (state as CommentsLoaded).comments;

    final updated = current.map((c) {
      if (c.id == commentId) {
        final isLiked = !c.isLikedByMe;

        return c.copyWith(
          isLikedByMe: isLiked,
          likeCount: c.likeCount + (isLiked ? 1 : -1),
        );
      }
      return c;
    }).toList();

    emit(CommentsLoaded(updated));

    try {
      await repo.toggleCommentLike(commentId);
    } catch (e) {
      emit(CommentsLoaded(current));
    }
  }

  Future<void> deleteMyComment({
    required String postId,
    required String commentId,
  }) async {
    if (state is! CommentsLoaded) return;

    final current = (state as CommentsLoaded).comments;

    try {
      await repo.deleteMyComment(commentId);

      final updated = current
          .where((comment) => comment.id != commentId)
          .toList();

      emit(CommentsLoaded(updated));

      postsCubit.decrementCommentCount(postId);

    } catch (e) {
      emit(CommentsError(e.toString()));
    }
  }

  Future<void> deleteAnyComment({
    required String postId,
    required String commentId,
  }) async {
    if (state is! CommentsLoaded) return;

    final current = (state as CommentsLoaded).comments;

    try {
      await repo.deleteAnyComment(commentId);

      final updated = current
          .where((comment) => comment.id != commentId)
          .toList();

      emit(CommentsLoaded(updated));

      postsCubit.decrementCommentCount(postId);

    } catch (e) {
      emit(CommentsError(e.toString()));
    }
  }
}
