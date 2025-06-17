import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/post.dart';
import 'package:social/features/facebook/presentation/components/post_item.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  const PostsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == posts.length - 1 ? 20 : 8,
              top: index == 0 ? 20 : 0,
            ),
            child: PostItem(post: posts[index]),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
