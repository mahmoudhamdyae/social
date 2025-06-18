import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';

import '../../../../core/components/screens/loading_screen.dart';
import '../cubit/comments_state.dart';

class AddCommentSection extends StatefulWidget {

  final String postId;
  final PostType postType;

  const AddCommentSection({
    super.key,
    required this.postId,
    required this.postType
  });

  @override
  State<AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends State<AddCommentSection> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
            key: formState,
            child: Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) => value!.isEmpty ? 'Please enter a comment' : null,
                  controller: BlocProvider.of<CommentsCubit>(context).addCommentController,
                )
            )
        ),
        16.pw,
        BlocBuilder<CommentsCubit, CommentsStates>(
          buildWhen: (previous, current) =>
          current is LoadingAddCommentState ||
              current is ErrorAddCommentState ||
              current is SuccessAddCommentState,
          builder: (BuildContext context, CommentsStates state) {
            return state is LoadingAddCommentState ? LoadingScreen()
                :
            InkWell(
              onTap: () {
                _sendComment();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary
                ),
                child: Icon(
                    Icons.send,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _sendComment() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      BlocProvider.of<CommentsCubit>(context).addComment(widget.postId, widget.postType);
    }
  }
}
