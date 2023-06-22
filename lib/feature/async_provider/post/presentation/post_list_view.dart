import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_riverpod/feature/async_provider/post/domain/post_view_model.dart';

import '../data/model/post.dart';

class PostListView extends ConsumerWidget {
  const PostListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPost = ref.watch(postViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: asyncPost.when(
          data: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return ListTile(
                  title: Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(post.body),
                );
              },
            );
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
