import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/presentation/components/add_comment_section.dart';
import 'package:social/features/facebook/presentation/components/comments_list.dart';
import 'package:social/features/facebook/presentation/components/empty_comments.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';

class CommentsSheet extends StatelessWidget {

  final List<Comment> comments;
  final int postId;

  const CommentsSheet({
    super.key,
    required this.comments,
    required this.postId
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: comments.isEmpty ? EmptyComments()
          :
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          children: [
            Expanded(child: CommentsList(comments: comments)),
            16.ph,
            BlocConsumer<FacebookCubit, FacebookStates>(
              listenWhen: (previous, current) =>
              current is LoadingAddCommentState ||
                  current is ErrorAddCommentState ||
                  current is SuccessAddCommentState,
              listener: (BuildContext context, FacebookStates state) {
                if (state is SuccessAddCommentState) {
                  BlocProvider.of<FacebookCubit>(context).getPosts();
                }
              },
              buildWhen: (previous, current) =>
                  current is LoadingAddCommentState ||
                  current is ErrorAddCommentState ||
                  current is SuccessAddCommentState,
              builder: (BuildContext context, FacebookStates state) {
                return state is LoadingAddCommentState ? LoadingScreen()
                    :
                AddCommentSection(postId: postId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
