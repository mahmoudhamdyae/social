import 'package:social/features/instagram/domain/models/insta.dart';

class InstaEntity extends Insta {

  InstaEntity({
    super.id,
    super.images,
    super.video,
    super.likesNo,
    super.commentNo,
    super.userName,
    super.userImage,
  });

  factory InstaEntity.fromJson(dynamic json) {
    return InstaEntity(
      id: json['id'],
      images: List<String>.from(json['images'] ?? []),
      video: List<String>.from(json['video'] ?? []),
      likesNo: json['likes_no'],
      commentNo: json['comment_no'],
      userName: json['user_name'],
      userImage: json['user_image'],
    );
  }
}