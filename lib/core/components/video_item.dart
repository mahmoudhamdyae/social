import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {

  final String link;
  const VideoItem({super.key, required this.link});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.link))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
      children: [
        GestureDetector(
          onTap: () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        )
      ],
    )
        : Container();
  }
}
