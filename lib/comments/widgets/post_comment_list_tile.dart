import 'package:flutter/material.dart';
import 'package:post_app/comments/models/post_comment.dart';

class PostCommentListTile extends StatelessWidget {
  final PostComment comment;

  const PostCommentListTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(comment.name, style: theme.textTheme.titleSmall),
        Text(
          comment.email,
          style: TextStyle(color: Colors.grey[700]!),
        ),
        const SizedBox(height: 8.0),
        Text(comment.body),
      ],
    );
  }
}
