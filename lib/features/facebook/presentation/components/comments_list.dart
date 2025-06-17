import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/presentation/components/comment_item.dart';

class CommentsList extends StatelessWidget {

  final List<Comment> comments;
  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: comments.length,
      separatorBuilder: (BuildContext context, int index) => 24.ph,
      itemBuilder: (BuildContext context, int index) {
        return CommentItem(comment: comments[index]);
      },
    );
  }
}
