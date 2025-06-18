import 'package:flutter/material.dart';
import 'package:social/core/components/cached_image.dart';
import 'package:social/features/stories/domain/models/story.dart';

class StoryItem extends StatelessWidget {

  final Story story;
  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          SizedBox(
            width: 125,
            height: 200,
            child: CachedImage(
              imageUrl: story.image ?? '',
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          IgnorePointer(
            child: Container(
              color: Colors.black.withValues(alpha: .2),
              width: 125,
              height: 200,
            ),
          ),
          // User Image
          PositionedDirectional(
            start: 8,
            top: 8,
            child: IgnorePointer(
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(1),
                  color: Theme.of(context).colorScheme.secondary,
                  width: 30,
                  height: 30,
                  child: ClipOval(
                    child: CachedImage(imageUrl: story.userImage ?? ''),
                  ),
                ),
              ),
            ),
          ),
          // User Name
          PositionedDirectional(
              bottom: 2,
              start: 8,
              end: 8,
              child: IgnorePointer(
                child: Text(
                  story.userName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
