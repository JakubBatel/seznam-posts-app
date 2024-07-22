import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'post_comment.g.dart';
part 'post_comment.freezed.dart';

@freezed
class PostComment with _$PostComment {
  @HiveType(typeId: 5, adapterName: 'PostCommentClassAdapter')
  const factory PostComment({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required String body,
  }) = _PostComment;

  factory PostComment.fromJson(Map<String, Object?> json) => _$PostCommentFromJson(json);
}
