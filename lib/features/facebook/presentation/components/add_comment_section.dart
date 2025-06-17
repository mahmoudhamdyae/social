import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';

import '../../../../core/components/screens/loading_screen.dart';
import '../cubit/facebook_states.dart';

class AddCommentSection extends StatefulWidget {

  final int postId;
  const AddCommentSection({super.key, required this.postId});

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
                  controller: BlocProvider.of<FacebookCubit>(context).addCommentController,
                )
            )
        ),
        16.pw,
        BlocBuilder<FacebookCubit, FacebookStates>(
          buildWhen: (previous, current) =>
          current is LoadingAddCommentState ||
              current is ErrorAddCommentState ||
              current is SuccessAddCommentState,
          builder: (BuildContext context, FacebookStates state) {
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
      BlocProvider.of<FacebookCubit>(context).addComment(widget.postId);
    }
  }
}
