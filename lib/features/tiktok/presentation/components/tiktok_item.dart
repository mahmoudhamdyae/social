import 'package:flutter/material.dart';
import 'package:social/features/tiktok/presentation/components/video_description.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/components/video_item.dart';
import '../../domain/models/video.dart';
import 'actions_toolbar.dart';

class TiktokItem extends StatelessWidget {
  final Video video;

  const TiktokItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoItem(link: video.url ?? ''),
        videoCard(video)
      ],
    );
  }

  Widget videoCard(Video video) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            VideoDescription(video.userName, video.videoTitle, video.songName),
            ActionsToolbar(
                video.likes ?? '',
                video.comments ?? '',
                video.userImage ?? ''
            ),
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
