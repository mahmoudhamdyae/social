import 'comment.dart';

class Post {
  int? id;
  String? post;
  List<String>? images;
  String? video;
  int? likesNo;
  String? userName;
  String? userImage;

  Post({
    this.id,
    this.post,
    this.images,
    this.video,
    this.likesNo,
    this.userName,
    this.userImage,
  });
}