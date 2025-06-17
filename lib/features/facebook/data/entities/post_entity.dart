import 'package:social/features/facebook/data/entities/comment_entity.dart';
import 'package:social/features/facebook/domain/models/post.dart';

class PostEntity extends Post {

  PostEntity({
    super.id,
    super.post,
    super.images,
    super.video,
    super.likesNo,
    super.userName,
    super.userImage,
    super.comments
  });

  factory PostEntity.fromJson(dynamic json) {
    return PostEntity(
        id: json['id'],
        post: json['post'],
        images: List<String>.from(json['images'] ?? []),
        video: json['video'],
        likesNo: json['likes_no'],
        userName: json['user_name'],
        userImage: json['user_image'],
        comments: List.from(json['comments'] ?? []).map((e) => CommentEntity.fromJson(e)).toList(),
    );
  }
}