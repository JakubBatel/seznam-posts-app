// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCommentsHash() => r'e6f3e62c2f0f1457ab4b2e6ccb85f5ecb308042b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PostComments
    extends BuildlessAutoDisposeAsyncNotifier<List<PostComment>> {
  late final int postId;

  FutureOr<List<PostComment>> build(
    int postId,
  );
}

/// See also [PostComments].
@ProviderFor(PostComments)
const postCommentsProvider = PostCommentsFamily();

/// See also [PostComments].
class PostCommentsFamily extends Family<AsyncValue<List<PostComment>>> {
  /// See also [PostComments].
  const PostCommentsFamily();

  /// See also [PostComments].
  PostCommentsProvider call(
    int postId,
  ) {
    return PostCommentsProvider(
      postId,
    );
  }

  @override
  PostCommentsProvider getProviderOverride(
    covariant PostCommentsProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postCommentsProvider';
}

/// See also [PostComments].
class PostCommentsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PostComments, List<PostComment>> {
  /// See also [PostComments].
  PostCommentsProvider(
    int postId,
  ) : this._internal(
          () => PostComments()..postId = postId,
          from: postCommentsProvider,
          name: r'postCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCommentsHash,
          dependencies: PostCommentsFamily._dependencies,
          allTransitiveDependencies:
              PostCommentsFamily._allTransitiveDependencies,
          postId: postId,
        );

  PostCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  FutureOr<List<PostComment>> runNotifierBuild(
    covariant PostComments notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PostComments Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostCommentsProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PostComments, List<PostComment>>
      createElement() {
    return _PostCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCommentsProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCommentsRef
    on AutoDisposeAsyncNotifierProviderRef<List<PostComment>> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _PostCommentsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PostComments,
        List<PostComment>> with PostCommentsRef {
  _PostCommentsProviderElement(super.provider);

  @override
  int get postId => (origin as PostCommentsProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
