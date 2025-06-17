import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TiktokItem extends StatefulWidget {
  const TiktokItem({super.key});

  @override
  State<TiktokItem> createState() => _TiktokItemState();
}

class _TiktokItemState extends State<TiktokItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
          onTap: () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          },
          child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
        )
        : Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
