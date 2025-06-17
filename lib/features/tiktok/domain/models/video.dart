import 'package:video_player/video_player.dart';

class Video {
  String? id;
  String? user;
  String? userPic;
  String? videoTitle;
  String? songName;
  String? likes;
  String? comments;
  String? url;

  VideoPlayerController? controller;

  Video({
    this.id,
    this.user,
    this.userPic,
    this.videoTitle,
    this.songName,
    this.likes,
    this.comments,
    this.url
  });

  Future<Null> loadController() async {
    controller = VideoPlayerController.network(url!);
    await controller?.initialize();
    controller?.setLooping(true);
  }
}