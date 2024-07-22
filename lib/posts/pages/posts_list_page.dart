import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:post_app/posts/providers/posts_provider.dart';
import 'package:post_app/posts/widgets/post_list_tile.dart';

class PostsListPage extends ConsumerWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: switch (posts) {
        AsyncData(value: final posts) => AnimationLimiter(
            child: ListView.builder(
              itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 64.0,
                  child: FadeInAnimation(child: PostListTile(post: posts[index])),
                ),
              ),
              itemCount: posts.length,
            ),
          ),
        AsyncError(error: final error) => Center(child: Text(error.toString())),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
