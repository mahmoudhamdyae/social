import 'comment.dart';

class Post {
  int? id;
  String? post;
  List<String>? images;
  String? video;
  int? likesNo;
  int? commentNo;
  String? userName;
  String? userImage;

  Post({
    this.id,
    this.post,
    this.images,
    this.video,
    this.likesNo,
    this.commentNo,
    this.userName,
    this.userImage,
  });
}