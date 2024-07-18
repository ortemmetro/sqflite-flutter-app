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

class PostsDeletePost extends PostsEvent {
  final Post post;

  PostsDeletePost({
    required this.post,
  });
}

class PostsUpdatePost extends PostsEvent {
  final Post post;

  PostsUpdatePost({
    required this.post,
  });
}

class PostsGetAllPosts extends PostsEvent {}
