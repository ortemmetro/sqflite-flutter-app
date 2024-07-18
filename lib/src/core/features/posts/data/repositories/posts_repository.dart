import 'dart:developer';

import 'package:asd/src/core/features/posts/data/data_source/local/posts_database_data_source.dart';
import 'package:asd/src/core/features/posts/domain/entities/post_model.dart';
import 'package:asd/src/core/features/posts/domain/repositories/i_posts_repository.dart';

class PostsRepository implements IPostsRepository {
  final PostsDatabaseDataSource _postsDatabaseDataSource;

  PostsRepository(
    this._postsDatabaseDataSource,
  );

  @override
  Future<int> addPost(Post post) async {
    try {
      return await _postsDatabaseDataSource.addPost(post);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<int> deletePost(Post post) async {
    try {
      return await _postsDatabaseDataSource.deletePost(post);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      return await _postsDatabaseDataSource.getAllPosts();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<int> updatePost(Post post) async {
    try {
      return await _postsDatabaseDataSource.updatePost(post);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
