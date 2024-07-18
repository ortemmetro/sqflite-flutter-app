import 'package:asd/src/core/di/dependency_injection.dart';
import 'package:asd/src/core/di/get_it_provider.dart';
import 'package:asd/src/core/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:asd/src/core/features/posts/presentation/pages/add_post_page.dart';
import 'package:asd/src/core/features/posts/presentation/pages/posts_page.dart';
import 'package:asd/src/core/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider.value(
          value: GetItProvider(
            instance: getIt,
          ),
        ),
        BlocProvider(
          create: (context) => context.get<PostsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const PostsPage(),
          '/add-post': (context) => const AddPostPage(),
        },
      ),
    );
  }
}
