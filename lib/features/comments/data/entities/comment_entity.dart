import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/comments/domain/models/comment.dart';

class CommentEntity extends Comment {

  CommentEntity({
    super.id,
    super.userName,
    super.userImage,
    super.comment,
  });

  factory CommentEntity.fromJson(dynamic json) {
    return CommentEntity(
      id: json['id'],
      userName: json['user_name'],
      userImage: json['user_image'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'user_image': userImage,
      'comment': comment,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}