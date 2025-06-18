import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';

class VideoDescription extends StatelessWidget {
  final String userName;
  final String videoTitle;
  final String songInfo;

  const VideoDescription(
      this.userName,
      this.videoTitle,
      this.songInfo,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 120,
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  7.ph,
                  Text(
                    videoTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  7.ph,
                  Row(children: [
                    Icon(
                      Icons.music_note,
                      size: 15.0,
                      color: Colors.white,
                    ),
                    Text(songInfo,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0
                        )
                    )
                  ]),
                  10.ph,
                ])));
  }
}