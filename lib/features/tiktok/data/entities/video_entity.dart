import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoEntity extends Video {

  VideoPlayerController? controller;

  VideoEntity({
    super.id,
    super.userName,
    super.userImage,
    super.videoTitle,
    super.songName,
    super.likes,
    super.comments,
    super.url
  });

  factory VideoEntity.fromJson(dynamic json) {
    return VideoEntity(
      id: json['id'],
      userName: json['user'],
      userImage: json['user_pic'],
      videoTitle: json['video_title'],
      songName: json['song_name'],
      likes: json['likes'],
      comments: json['comments'],
      url: json['url'],
    );
  }
}