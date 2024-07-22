import 'dart:convert';

import 'package:post_app/posts/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'post_provider.g.dart';

@riverpod
Future<Post> post(PostRef ref, int postId) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    if (json is Map<String, Object?>) {
      return Post.fromJson(json);
    }
  }
  throw Exception(response.body);
}
