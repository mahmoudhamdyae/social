import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/domain/models/comment.dart';

import 'comment_item.dart';

class CommentsList extends StatelessWidget {

  final List<Comment> comments;
  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 20, top: MediaQuery.paddingOf(context).top + 32),
      itemCount: comments.length,
      separatorBuilder: (BuildContext context, int index) => 24.ph,
      itemBuilder: (BuildContext context, int index) {
        return CommentItem(comment: comments[index]);
      },
    );
  }
}
