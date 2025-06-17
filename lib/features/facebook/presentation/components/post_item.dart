import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/custom_shadow.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/post.dart';
import 'package:social/features/facebook/presentation/components/comments_sheet.dart';
import 'package:social/features/facebook/presentation/components/post_images.dart';
import 'package:social/features/facebook/presentation/components/user_section.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';

import 'like_button.dart';

class PostItem extends StatelessWidget {

  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: customMainBoxShadow(context: context)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserSection(
              userName: post.userName ?? '',
              userImage: post.userImage ?? ''
          ),
          16.ph,
          // Post
          Text(
            post.post ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          (post.images != null && post.images!.isNotEmpty ? 8 : 0).ph,
          post.images != null && post.images!.isNotEmpty ?
          PostImages(images: post.images!) : const SizedBox(),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // No of Likes
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 16,
                    ),
                  ),
                  8.pw,
                  Text(
                    '${post.likesNo}'
                  )
                ],
              ),
              // No of Comments
              InkWell(
                onTap: () { _onClickComments(context); },
                child: Text(
                  '${post.commentNo ?? 0} comments'
                ),
              )
            ],
          ),
          16.ph,
          // Actions
          Row(
            children: [
              // Like Button
              Expanded(
                child: LikeButton(post: post),
              ),
              16.pw,
              // Comment Button
              Expanded(
                child: InkWell(
                    onTap: () {
                      _onClickComments(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          color: Colors.black87,
                        ),
                        16.pw,
                        Text(
                          'Comment',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onClickComments(BuildContext context) {
    BlocProvider.of<FacebookCubit>(context).getComments(post.id ?? -1);
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (BuildContext builderContext) =>
            BlocProvider.value(
              value: BlocProvider.of<FacebookCubit>(context),
              child: CommentsSheet(
                postId: post.id ?? -1,
              ),
            )
    );
  }
}
