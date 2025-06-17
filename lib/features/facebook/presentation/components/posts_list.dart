import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/post.dart';
import 'package:social/features/facebook/presentation/components/post_item.dart';

class PostsList extends StatelessWidget {

  final List<Post> posts;
  const PostsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: posts.length,
      separatorBuilder: (BuildContext context, int index) => 8.ph,
      itemBuilder: (BuildContext context, int index) {
        return PostItem(post: posts[index],);
      },
    );
  }
}
