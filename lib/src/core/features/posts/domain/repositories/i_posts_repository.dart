import 'package:asd/src/core/features/posts/domain/entities/post_model.dart';

abstract class IPostsRepository {
  Future<int> addPost(Post post);
  Future<int> updatePost(Post post);
  Future<int> deletePost(Post post);
  Future<List<Post>> getAllPosts();
}
