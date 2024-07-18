import 'package:asd/src/core/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:asd/src/core/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-post');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ),
        child: const SizedBox(
          height: 50,
          child: Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Posts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.posts.isEmpty) {
                return const Center(
                  child: Text('There is nothing to show now'),
                );
              }
              if (state is PostsLoaded) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(
                        title: state.posts[index].title,
                        description: state.posts[index].description,
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
