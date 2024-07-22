import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post_app/app_root.dart';
import 'package:post_app/comments/models/post_comment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocsDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocsDir.path);
  Hive.registerAdapter(PostCommentClassAdapter());

  Hive.openBox<PostComment>('comments');

  runApp(const ProviderScope(child: AppRoot()));
}
