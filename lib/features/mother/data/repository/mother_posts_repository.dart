import 'dart:io';

import '../api/mother_posts_api_service.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';

class PostsRepository {
  final PostsApiService api;

  PostsRepository(this.api);

  // ================= POSTS =================

  Future<List<PostModel>> getFeed(int page) async {
    final res = await api.getFeed(page, 10, 1);
    return res.data;
  }

  Future<List<PostModel>> getPosts({
    required bool isAdmin,
    required int page,
    int pageSize = 20,
  }) async {
    final res = isAdmin
        ? await api.getAdminPosts(page, pageSize)
        : await api.getFeed(page, pageSize, 0);

    return res.data;
  }

  Future<List<PostModel>> getSaved(int page) async {
    final res = await api.getSaved(page, 10);
    return res.data;
  }

  Future<void> createPost({
    String? title,
    String? content,
    String? tagId,
    String? imagePath,
  }) async {
    await api.createPost(
      title: title,
      content: content,
      tagId: tagId,
      image: imagePath != null ? File(imagePath) : null,
    );
  }

  Future<void> toggleLike(String id) async {
    await api.toggleLike(id);
  }

  Future<void> toggleSave(String id) async {
    await api.toggleSave(id);
  }

  Future<void> deleteMyPost(String postId) async {
    await api.deleteMyPost(postId);
  }

  Future<void> deleteAnyPost(String postId) async {
    await api.deleteAnyPost(postId);
  }

  // ================= COMMENTS =================

  Future<List<CommentModel>> getComments(String postId) async {
    final res = await api.getComments(postId, 1, 20);
    return res.data;
  }

  Future<void> addComment(
      String postId,
      String content, {
        String? parentCommentId,
      }) async {
    await api.addComment(postId, {
      "content": content,
      "parentCommentId": parentCommentId,
    });
  }

  Future<void> toggleCommentLike(String commentId) async {
    await api.toggleCommentLike(commentId);
  }

  Future<void> deleteMyComment(String commentId) async {
    await api.deleteMyComment(commentId);
  }

  Future<void> deleteAnyComment(String commentId) async {
    await api.deleteAnyComment(commentId);
  }

// ================= EXPERIENCES =================

  Future<List<PostModel>> getExperiences(int page) async {
    final res = await api.getFeed(page, 10, 2);
    return res.data;
  }

  Future<void> createExperience(
      String challenge,
      String solution,
      ) async {
    await api.createExperience({
      "challenge": challenge,
      "solution": solution,
    });
  }
}
