import 'package:flutter/material.dart';
import 'package:social/features/tiktok/presentation/components/video_description.dart';

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
        SizedBox(
            height: MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).vertical,
            width: MediaQuery.sizeOf(context).width,
            child: VideoItem(link: video.url ?? '')
        ),
        videoContent(video)
      ],
    );
  }

  Widget videoContent(Video video) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VideoDescription(
                video.userName ?? '',
                video.videoTitle ?? '',
                video.songName ?? ''
            ),
            ActionsToolbar(
                '${video.likes ?? 0}',
                '${video.comments ?? 0}',
                video.userImage ?? '',
                postId: video.id ?? '',
            ),
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
