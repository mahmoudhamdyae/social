import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoEntity extends Video {

  VideoPlayerController? controller;

  VideoEntity({
    super.id,
    super.user,
    super.userPic,
    super.videoTitle,
    super.songName,
    super.likes,
    super.comments,
    super.url
  });

  factory VideoEntity.fromJson(dynamic json) {
    return VideoEntity(
      id: json['id'],
      user: json['user'],
      userPic: json['user_pic'],
      videoTitle: json['video_title'],
      songName: json['song_name'],
      likes: json['likes'],
      comments: json['comments'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = super.id;
    data['user'] = super.user;
    data['user_pic'] = super.userPic;
    data['video_title'] = super.videoTitle;
    data['song_name'] = super.songName;
    data['likes'] = super.likes;
    data['comments'] = super.comments;
    data['url'] = super.url;
    return data;
  }
}