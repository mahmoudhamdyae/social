import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';

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
                    border: OutlineInputBorder(),
                  ),
                  controller: BlocProvider.of<FacebookCubit>(context).addCommentController,
                )
            )
        ),
        InkWell(
          onTap: () {
            _sendComment();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary
            ),
            child: Icon(
              Icons.send
            ),
          ),
        ),
      ],
    );
  }

  void _sendComment() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      BlocProvider.of<FacebookCubit>(context).addComment();
    }
  }
}
