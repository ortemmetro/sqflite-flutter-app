import 'package:asd/src/core/features/posts/data/data_source/local/posts_database_data_source.dart';
import 'package:asd/src/core/features/posts/data/repositories/posts_repository.dart';
import 'package:asd/src/core/features/posts/domain/repositories/i_posts_repository.dart';
import 'package:asd/src/core/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerDependencies() async {
  getIt.registerSingleton<PostsDatabaseDataSource>(
    PostsDatabaseDataSource(),
  );

  getIt.registerSingleton<IPostsRepository>(
    PostsRepository(
      getIt<PostsDatabaseDataSource>(),
    ),
  );

  getIt.registerFactory<PostsBloc>(
    () => PostsBloc(
      getIt<IPostsRepository>(),
    ),
  );
}
