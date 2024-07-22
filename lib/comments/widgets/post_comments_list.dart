import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:post_app/comments/providers/post_comments_provider.dart';
import 'package:post_app/comments/widgets/post_comment_list_tile.dart';

class PostCommentsSliverList extends ConsumerWidget {
  final int postId;

  const PostCommentsSliverList({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(postCommentsProvider(postId));

    return switch (comments) {
      AsyncData(value: final comments) => AnimationLimiter(
          child: SliverList.separated(
            itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 64.0,
                child: FadeInAnimation(
                  child: PostCommentListTile(comment: comments[index]),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 24.0),
            itemCount: comments.length,
          ),
        ),
      AsyncError(error: final error) => SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
      _ => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
    };
  }
}
