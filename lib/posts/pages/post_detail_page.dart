import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_app/comments/widgets/add_comment_bottom_sheet.dart';
import 'package:post_app/comments/widgets/post_comments_list.dart';
import 'package:post_app/posts/providers/post_provider.dart';

class PostDetailPage extends ConsumerWidget {
  final int postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final post = ref.watch(postProvider(postId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    enableDrag: false,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) => AddCommentBottomSheet(postId: postId),
                  ),
              icon: const Icon(Icons.add_comment)),
        ],
      ),
      body: switch (post) {
        AsyncData(value: final post) => CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(post.title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 16.0),
                    Text(post.body),
                    const SizedBox(height: 24.0),
                    Text('Comments', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              PostCommentsSliverList(postId: postId),
              const SliverSafeArea(sliver: SliverToBoxAdapter(child: SizedBox(height: 16))),
            ].map((e) => SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 24.0), sliver: e)).toList(),
          ),
        AsyncError(error: final error) => Center(child: Text(error.toString())),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
