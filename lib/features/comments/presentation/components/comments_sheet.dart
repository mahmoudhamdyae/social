import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:social/features/comments/presentation/components/empty_comments.dart';
import 'package:social/features/instagram/presentation/cubit/insta_cubit.dart';
import 'package:social/features/tiktok/presentation/cubit/tiktok_cubit.dart';

import '../../../../core/components/screens/error_screen.dart';
import '../../../facebook/presentation/cubit/facebook_cubit.dart';
import '../cubit/comments_state.dart';
import 'add_comment_section.dart';
import 'comments_list.dart';

class CommentsSheet extends StatelessWidget {

  final String postId;
  final PostType postType;

  const CommentsSheet({
    super.key,
    required this.postId,
    required this.postType
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsStates>(
      listenWhen: (previous, current) =>
      current is LoadingAddCommentState ||
          current is ErrorAddCommentState ||
          current is SuccessAddCommentState,
      listener: (BuildContext context, CommentsStates state) {
        if (state is SuccessAddCommentState) {
          switch(postType) {
            case PostType.facebook:
              BlocProvider.of<FacebookCubit>(context).getPostsWithoutLoading();
            case PostType.instagram:
              BlocProvider.of<InstaCubit>(context).getInstaWithoutLoading();
            case PostType.tiktok:
              BlocProvider.of<TiktokCubit>(context).getVideosWithoutLoading();
          }
        }
      },
      buildWhen: (previous, current) =>
          current is LoadingGetCommentsState ||
          current is ErrorGetCommentsState ||
          current is SuccessGetCommentsState,
      builder: (BuildContext context, CommentsStates state) {
        return state is LoadingGetCommentsState ? LoadingScreen()
        :
        state is ErrorGetCommentsState ? ErrorScreen(errorMessage: state.errorMessage ?? '')
        :
        state is SuccessGetCommentsState ?
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              children: [
                (MediaQuery.paddingOf(context).top + 24).ph,
                Expanded(
                    child: state.comments.isEmpty ? EmptyComments()
                        :
                    CommentsList(comments: state.comments)
                ),
                16.ph,
                AddCommentSection(postId: postId, postType: postType,),
                (MediaQuery.paddingOf(context).bottom + 16).ph,
              ],
            ),
          ),
        )
        : const SizedBox();
      },
    );
  }
}
