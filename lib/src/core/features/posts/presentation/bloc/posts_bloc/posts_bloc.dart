import 'package:asd/src/core/features/posts/domain/entities/post_model.dart';
import 'package:asd/src/core/features/posts/domain/repositories/i_posts_repository.dart';
import 'package:bloc/bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final IPostsRepository _postsRepository;

  PostsBloc(this._postsRepository)
      : super(
          PostsInitial(
            posts: [],
          ),
        ) {
    on<PostsEvent>(
      (event, emit) async {
        switch (event) {
          case PostsAddPost():
            await _addPost(event, emit);
            break;
          case PostsGetAllPosts():
            await _getAllPosts(event, emit);
            break;
          case PostsUpdatePost():
            await _updatePost(event, emit);
            break;
          case PostsDeletePost():
            await _deletePost(event, emit);
            break;
          default:
        }
      },
    );
    add(PostsGetAllPosts());
  }

  Future<void> _addPost(
    PostsAddPost event,
    Emitter<PostsState> emit,
  ) async {
    emit(
      PostsLoading(
        posts: state.posts,
      ),
    );
    try {
      await _postsRepository.addPost(
        Post(
          title: event.title,
          description: event.description,
        ),
      );
      await _getAllPosts(
        PostsGetAllPosts(),
        emit,
      );
    } catch (e) {
      emit(
        PostsError(
          errorMessage: e.toString(),
          posts: state.posts,
        ),
      );
    }
  }

  Future<void> _getAllPosts(
    PostsGetAllPosts event,
    Emitter<PostsState> emit,
  ) async {
    emit(
      PostsLoading(
        posts: state.posts,
      ),
    );
    try {
      final posts = await _postsRepository.getAllPosts();
      emit(
        PostsLoaded(
          posts: posts,
        ),
      );
    } catch (e) {
      emit(
        PostsError(
          errorMessage: e.toString(),
          posts: state.posts,
        ),
      );
    }
  }

  Future<void> _updatePost(
    PostsUpdatePost event,
    Emitter<PostsState> emit,
  ) async {
    emit(
      PostsLoading(
        posts: state.posts,
      ),
    );

    try {
      await _postsRepository.updatePost(event.post);
      add(PostsGetAllPosts());
    } catch (e) {
      emit(
        PostsError(
          errorMessage: e.toString(),
          posts: state.posts,
        ),
      );
    }
  }

  Future<void> _deletePost(
    PostsDeletePost event,
    Emitter<PostsState> emit,
  ) async {
    emit(
      PostsLoading(
        posts: state.posts,
      ),
    );

    try {
      await _postsRepository.deletePost(event.post);
      add(PostsGetAllPosts());
    } catch (e) {
      emit(
        PostsError(
          errorMessage: e.toString(),
          posts: state.posts,
        ),
      );
    }
  }
}
