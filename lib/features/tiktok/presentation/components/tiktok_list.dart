import 'package:flutter/material.dart';
import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:social/features/tiktok/presentation/components/tiktok_item.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class TiktokList extends StatelessWidget {
  
  final List<Video> videos;
  final Controller controller;
  
  const TiktokList({
    super.key,
    required this.videos,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TikTokStyleFullPageScroller(
      contentSize: videos.length,
      swipePositionThreshold: 0.2,
      swipeVelocityThreshold: 2000,
      animationDuration: const Duration(milliseconds: 400),
      controller: controller,
      builder: (BuildContext context, int index) {
        return TiktokItem(link: videos[index].url ?? '');
      },
    );
  }
}
