import 'package:social/features/instagram/domain/models/insta.dart';

class InstaEntity extends Insta {

  InstaEntity({
    super.id,
    super.images,
    super.videos,
    super.likesNo,
    super.commentNo,
    super.userName,
    super.userImage,
    super.text
  });

  factory InstaEntity.fromJson(dynamic json) {
    return InstaEntity(
      id: json['id'],
      images: List<String>.from(json['images'] ?? []),
      videos: List<String>.from(json['videos'] ?? []),
      likesNo: json['likes_no'],
      commentNo: json['comment_no'],
      userName: json['user_name'],
      userImage: json['user_image'],
      text: json['text'],
    );
  }
}