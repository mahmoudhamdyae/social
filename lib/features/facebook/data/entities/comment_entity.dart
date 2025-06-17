import 'package:social/features/facebook/domain/models/comment.dart';

class CommentEntity extends Comment {

  CommentEntity({
    super.id,
    super.userName,
    super.userImage,
    super.comment,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
      id: json['id'],
      userName: json['userName'],
      userImage: json['userImage'],
      comment: json['comment'],
    );
  }
}