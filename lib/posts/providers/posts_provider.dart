import 'dart:convert';

import 'package:post_app/posts/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'posts_provider.g.dart';

@riverpod
Future<List<Post>> posts(PostsRef ref) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    if (json is List<dynamic>) {
      return json.cast<Map<String, Object?>>().map(Post.fromJson).toList(growable: false);
    }
  }
  throw Exception(response.body);
}
