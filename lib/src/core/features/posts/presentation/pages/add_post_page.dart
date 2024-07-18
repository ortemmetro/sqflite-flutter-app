import 'package:asd/src/core/features/posts/domain/entities/post_model.dart';
import 'package:asd/src/core/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrEditPostPage extends StatefulWidget {
  final Post? post;

  const AddOrEditPostPage({
    super.key,
    this.post,
  });

  @override
  State<AddOrEditPostPage> createState() => _AddOrEditPostPageState();
}

class _AddOrEditPostPageState extends State<AddOrEditPostPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _descriptionController.text = widget.post!.description;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post == null ? 'Add post' : 'Edit post',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            const Text('Description'),
            const SizedBox(height: 10),
            TextField(
              minLines: 5,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              controller: _descriptionController,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.post != null) {
                    context.read<PostsBloc>().add(
                          PostsUpdatePost(
                            post: Post(
                              id: widget.post?.id,
                              title: _titleController.text,
                              description: _descriptionController.text,
                            ),
                          ),
                        );
                  } else {
                    context.read<PostsBloc>().add(
                          PostsAddPost(
                            title: _titleController.text,
                            description: _descriptionController.text,
                          ),
                        );
                  }
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.post == null ? 'Add post' : 'Edit post',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
