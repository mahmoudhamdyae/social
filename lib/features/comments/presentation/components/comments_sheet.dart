import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:social/features/comments/presentation/components/empty_comments.dart';

import '../../../../core/components/screens/error_screen.dart';
import '../../../facebook/presentation/cubit/facebook_cubit.dart';
import '../cubit/comments_state.dart';
import 'add_comment_section.dart';
import 'comments_list.dart';

class CommentsSheet extends StatelessWidget {

  final int postId;

  const CommentsSheet({
    super.key,
    required this.postId
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
          BlocProvider.of<FacebookCubit>(context).getPostsWithoutLoading();
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
                AddCommentSection(postId: postId),
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
