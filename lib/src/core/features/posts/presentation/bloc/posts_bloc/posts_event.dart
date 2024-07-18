part of 'posts_bloc.dart';

sealed class PostsEvent {}

class PostsAddPost extends PostsEvent {
  final String title;
  final String description;

  PostsAddPost({
    required this.title,
    required this.description,
  });
}

class PostsDeletePost extends PostsEvent {}

class PostsUpdatePost extends PostsEvent {}

class PostsGetAllPosts extends PostsEvent {}
