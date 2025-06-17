import 'package:flutter/material.dart';
import 'package:social/features/stories/domain/models/story.dart';

class StoryItem extends StatelessWidget {

  final Story story;
  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        story.image ?? '',
        width: 125,
        fit: BoxFit.cover,
      ),
    );
  }
}
