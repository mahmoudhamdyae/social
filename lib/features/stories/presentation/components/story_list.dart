import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/stories/domain/models/story.dart';
import 'package:social/features/stories/presentation/components/create_story_widget.dart';
import 'package:social/features/stories/presentation/components/story_item.dart';

class StoryList extends StatelessWidget {

  final List<Story> stories;
  const StoryList({super.key, required this.stories});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        separatorBuilder: (BuildContext context, int index) => 16.pw,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? CreateStoryWidget(cubitContext: context,)
              :
          StoryItem(story: stories[index - 1]);
        },
      ),
    );
  }
}
