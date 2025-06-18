import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:social/features/facebook/domain/models/post.dart';
import 'package:social/features/facebook/presentation/components/post_item.dart';
import 'package:social/features/facebook/presentation/components/shimmer_post.dart';

class PostsList extends StatelessWidget {

  final List<Post> posts;
  final bool isLoading;

  const PostsList({
    super.key,
    required this.posts,
    required this.isLoading
  });

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
            child: BlocProvider<CommentsCubit>(
                create: (BuildContext context) => BlocProvider.of<CommentsCubit>(context),
                child: isLoading ? ShimmerPost() : PostItem(post: posts[index])
            ),
          );
        },
        childCount: isLoading ? 3 : posts.length,
      ),
    );
  }
}
