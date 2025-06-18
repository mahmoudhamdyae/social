import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';

import '../../domain/models/post.dart';
import '../cubit/facebook_cubit.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (isLiked) {
            BlocProvider.of<CommentsCubit>(context).dislikePost(widget.post.id!.toString(), PostType.facebook, () {
              BlocProvider.of<FacebookCubit>(context).getPostsWithoutLoading();
            });
            isLiked = false;
          } else {
            BlocProvider.of<CommentsCubit>(context).likePost(widget.post.id!.toString(), PostType.facebook, () {
              BlocProvider.of<FacebookCubit>(context).getPostsWithoutLoading();
            });
            isLiked = true;
          }
          setState(() {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up_alt_outlined,
              color: isLiked ? Theme.of(context).colorScheme.primary : Colors.black87,
            ),
            16.pw,
            Text(
              'Like',
              style: TextStyle(
                color: isLiked ? Theme.of(context).colorScheme.primary : Colors.black87,
              ),
            ),
          ],
        )
    );
  }
}