import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../addMemoryAndDocs/data/models/basic_response.dart';
import '../models/comments_response.dart';
import '../models/posts_response.dart';

part 'mother_posts_api_service.g.dart';

@RestApi()
abstract class PostsApiService {
  factory PostsApiService(Dio dio, {String baseUrl}) = _PostsApiService;

  // ================= POSTS =================

  @GET("posts/feed")
  Future<PostsResponse> getFeed(
      @Query("pageNumber") int pageNumber,
      @Query("pageSize") int pageSize,
      @Query("type") int? type,
      );

  @GET("posts/admin/all")
  Future<PostsResponse> getAdminPosts(
      @Query("pageNumber") int pageNumber,
      @Query("pageSize") int pageSize,
      );

  @GET("posts/saved")
  Future<PostsResponse> getSaved(
      @Query("pageNumber") int pageNumber,
      @Query("pageSize") int pageSize,
      );

  @MultiPart()
  @POST("posts/create")
  Future<BasicResponse> createPost({
    @Part(name: "Title") String? title,
    @Part(name: "Content") String? content,
    @Part(name: "TagId") String? tagId,
    @Part(name: "Image") File? image,
  });

  @POST("posts/{id}/toggle-like")
  Future<BasicResponse> toggleLike(@Path("id") String id);

  @POST("posts/{id}/toggle-save")
  Future<BasicResponse> toggleSave(@Path("id") String id);

  /// Delete my own post
  @DELETE("posts/my/{postId}")
  Future<BasicResponse> deleteMyPost(
      @Path("postId") String postId,
      );

  /// Delete any post (Admin)
  @DELETE("posts/{postId}")
  Future<BasicResponse> deleteAnyPost(
      @Path("postId") String postId,
      );

  // ================= COMMENTS =================

  @GET("posts/{id}/comments")
  Future<CommentsResponse> getComments(
      @Path("id") String id,
      @Query("pageNumber") int pageNumber,
      @Query("pageSize") int pageSize,
      );

  @POST("posts/{id}/comments")
  Future<BasicResponse> addComment(
      @Path("id") String id,
      @Body() Map<String, dynamic> body,
      );

  @POST("posts/comments/{id}/toggle-like")
  Future<BasicResponse> toggleCommentLike(@Path("id") String id);

  /// Delete my own comment
  @DELETE("posts/comments/my/{commentId}")
  Future<BasicResponse> deleteMyComment(
      @Path("commentId") String commentId,
      );

  /// Delete any comment (Admin)
  @DELETE("posts/comments/{commentId}")
  Future<BasicResponse> deleteAnyComment(
      @Path("commentId") String commentId,
      );

  // ================= EXPERIENCES =================

  @POST("posts/create-experience")
  Future<BasicResponse> createExperience(
      @Body() Map<String, dynamic> body,
      );

}
