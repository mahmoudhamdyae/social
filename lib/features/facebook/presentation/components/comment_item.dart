import 'package:flutter/material.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/presentation/components/user_section.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserSection(
          userName: comment.userName ?? '',
          userImage: comment.userImage ?? '',
        ),
        Text(
          comment.comment ?? ''
        ),
      ],
    );
  }
}
