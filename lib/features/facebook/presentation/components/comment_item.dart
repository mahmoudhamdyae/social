import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/presentation/components/user_section.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserSection(
          userName: comment.userName ?? '',
          userImage: comment.userImage ?? '',
        ),
        16.ph,
        Text(
          comment.comment ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
