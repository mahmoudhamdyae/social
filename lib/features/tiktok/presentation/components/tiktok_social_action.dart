import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/features/tiktok/presentation/cubit/tiktok_cubit.dart';

import '../../../../core/enums/post_type.dart';
import '../../../comments/presentation/components/comments_sheet.dart';
import '../../../comments/presentation/cubit/comments_cubit.dart';

class TiktokSocialAction extends StatefulWidget {

  final String postId;
  final String title;
  final IconData icon;
  final bool isFav;
  final bool isComment;

  const TiktokSocialAction({
    super.key,
    required this.postId,
    required this.title,
    required this.icon,
    this.isFav = false,
    this.isComment = false,
  });

  @override
  State<TiktokSocialAction> createState() => _TiktokSocialActionState();
}

class _TiktokSocialActionState extends State<TiktokSocialAction> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isFav ? () {
        _onClickFav(context);
      } : widget.isComment ? () {
        _onClickComments(context);
      } : null,
      child: Container(
          margin: EdgeInsets.only(top: 15.0),
          width: 70.0,
          height: 70.0,
          child: Column(children: [
            Icon(
                widget.icon, size: 35.0,
                color: widget.isFav && isLiked ? Colors.red : Colors.grey[300]
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0
                  )
              ),
            )
          ])),
    );
  }

  void _onClickFav(BuildContext context) {
    if (isLiked) {
      BlocProvider.of<CommentsCubit>(context).dislikePost(widget.postId, PostType.tiktok, () {
        BlocProvider.of<TiktokCubit>(context).getVideosWithoutLoading();
      });
      isLiked = false;
    } else {
      BlocProvider.of<CommentsCubit>(context).likePost(widget.postId, PostType.tiktok, () {
        BlocProvider.of<TiktokCubit>(context).getVideosWithoutLoading();
      });
      isLiked = true;
    }
    setState(() {});
  }

  void _onClickComments(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (_) =>
            BlocProvider.value(
              value: context.read<TiktokCubit>(),
              child: CommentsSheet(
                postId: widget.postId,
                postType: PostType.tiktok,
              ),
            )
    );
  }
}
