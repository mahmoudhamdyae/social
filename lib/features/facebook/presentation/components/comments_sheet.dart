import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentation/components/add_comment_section.dart';
import 'package:social/features/facebook/presentation/components/comments_list.dart';
import 'package:social/features/facebook/presentation/components/empty_comments.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';

import '../../../../core/components/screens/error_screen.dart';

class CommentsSheet extends StatelessWidget {

  final int postId;

  const CommentsSheet({
    super.key,
    required this.postId
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacebookCubit, FacebookStates>(
      buildWhen: (previous, current) =>
          current is LoadingGetCommentsState ||
          current is ErrorGetCommentsState ||
          current is SuccessGetCommentsState,
      builder: (BuildContext context, FacebookStates state) {
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
                Expanded(
                    child: state.comments.isEmpty ? EmptyComments()
                        :
                    CommentsList(comments: state.comments)
                ),
                16.ph,
                AddCommentSection(postId: postId),
                (MediaQuery.paddingOf(context).bottom).ph,
              ],
            ),
          ),
        )
        : const SizedBox();
      }
    );
  }
}
