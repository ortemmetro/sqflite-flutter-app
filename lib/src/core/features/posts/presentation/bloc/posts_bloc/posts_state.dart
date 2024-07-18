part of 'posts_bloc.dart';

sealed class PostsState {
  final List<Post> posts;

  const PostsState({
    required this.posts,
  });
}

final class PostsInitial extends PostsState {
  PostsInitial({required super.posts});
}

final class PostsLoading extends PostsState {
  PostsLoading({required super.posts});
}

final class PostsLoaded extends PostsState {
  PostsLoaded({required super.posts});
}

final class PostsError extends PostsState {
  final String errorMessage;

  PostsError({
    required this.errorMessage,
    required super.posts,
  });
}
