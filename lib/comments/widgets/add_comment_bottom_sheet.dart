import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_app/comments/providers/post_comments_provider.dart';
import 'package:post_app/common/utils/form_validators.dart';

class AddCommentBottomSheet extends ConsumerStatefulWidget {
  final int postId;

  const AddCommentBottomSheet({super.key, required this.postId});

  @override
  ConsumerState<AddCommentBottomSheet> createState() => _AddCommentBottomSheetState();
}

class _AddCommentBottomSheetState extends ConsumerState<AddCommentBottomSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _commentController;

  Future<void>? _pendingAddComment;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add comment', style: theme.textTheme.titleLarge),
                  const SizedBox(width: 16.0),
                  IconButton.filledTonal(
                    style: const ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(40, 40)),
                      fixedSize: WidgetStatePropertyAll(Size(40, 40)),
                    ),
                    iconSize: 20,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: FormValidators.notNullAndNotEmptyValidator(),
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: FormValidators.emailValidator(),
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _commentController,
                        decoration: const InputDecoration(
                          labelText: 'Comment',
                          alignLabelWithHint: true,
                        ),
                        minLines: 6,
                        maxLines: 10,
                        validator: FormValidators.notNullAndNotEmptyValidator(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              FutureBuilder(
                future: _pendingAddComment,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_pendingAddComment != null) {
                        return;
                      }
                      final form = Form.of(context);
                      final isValid = form.validate();
                      if (isValid) {
                        final addCommentFuture = ref.read(PostCommentsProvider(widget.postId).notifier).addComment(
                              postId: widget.postId,
                              name: _nameController.text,
                              email: _emailController.text,
                              body: _commentController.text,
                            );
                        setState(() {
                          _pendingAddComment = addCommentFuture;
                        });
                        addCommentFuture.then((_) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Comment added'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        }).onError((error, stackTrace) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (snapshot.connectionState == ConnectionState.waiting)
                          const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        const Text('Add'),
                        if (snapshot.connectionState == ConnectionState.waiting) const SizedBox(width: 32),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
