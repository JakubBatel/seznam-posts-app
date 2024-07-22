import 'package:go_router/go_router.dart';
import 'package:post_app/posts/pages/post_detail_page.dart';
import 'package:post_app/posts/pages/posts_list_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PostsListPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => PostDetailPage(postId: int.parse(state.pathParameters['id']!)),
        ),
      ],
    ),
  ],
);
