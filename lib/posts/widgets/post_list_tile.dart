import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:post_app/posts/models/post.dart';

class PostListTile extends StatelessWidget {
  final Post post;

  const PostListTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.go('/${post.id}'),
    );
  }
}
