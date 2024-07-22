import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:post_app/comments/models/post_comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'post_comments_provider.g.dart';

@riverpod
class PostComments extends _$PostComments {
  @override
  Future<List<PostComment>> build(int postId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json is List<dynamic>) {
        final liveComments = json.cast<Map<String, Object?>>().map(PostComment.fromJson);
        final commentsBox = Hive.box<PostComment>('comments');
        final localComments = commentsBox.values;
        return [...liveComments, ...localComments];
      }
    }
    throw Exception(response.body);
  }

  Future<void> addComment({
    required int postId,
    required String name,
    required String email,
    required String body,
  }) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'body': body,
      }),
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);

      if (json is Map<String, Object?>) {
        final post = PostComment.fromJson(json);
        try {
          final commentsBox = Hive.box<PostComment>('comments');
          await commentsBox.add(post);
        } catch (e) {
          print(e);
        }

        final previousState = await future;

        state = AsyncData([...previousState, post]);
        return;
      }
    }

    throw Exception(response.body);
  }
}
