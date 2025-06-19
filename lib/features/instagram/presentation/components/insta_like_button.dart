import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/instagram/presentation/cubit/insta_cubit.dart';

import '../../../../core/enums/post_type.dart';
import '../../../comments/presentation/cubit/comments_cubit.dart';

class InstaLikeButton extends StatefulWidget {

  final int postId;
  final int likesNo;

  const InstaLikeButton({
    super.key,
    required this.postId,
    required this.likesNo
  });

  @override
  State<InstaLikeButton> createState() => _InstaLikeButtonState();
}

class _InstaLikeButtonState extends State<InstaLikeButton> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (isLiked) {
            BlocProvider.of<CommentsCubit>(context).dislikePost(widget.postId.toString(), PostType.instagram, () {
              BlocProvider.of<InstaCubit>(context).getInstaWithoutLoading();
            });
            isLiked = false;
          } else {
            BlocProvider.of<CommentsCubit>(context).likePost(widget.postId.toString(), PostType.instagram, () {
              BlocProvider.of<InstaCubit>(context).getInstaWithoutLoading();
            });
            isLiked = true;
          }
          setState(() {});
        },
        child: Row(
          children: [
            Icon(
              Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.black87,
            ),
            8.pw,
            Text(
              '${widget.likesNo == 0 ? '' : widget.likesNo}',
              style: TextStyle(
                color: isLiked ? Colors.red : Colors.black87,
              ),
            ),
          ],
        )
    );
  }
}
