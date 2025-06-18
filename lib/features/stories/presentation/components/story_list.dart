import 'package:flutter/material.dart';
import 'package:social/core/components/shimmer_loading.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/stories/domain/models/story.dart';
import 'package:social/features/stories/presentation/components/create_story_widget.dart';
import 'package:social/features/stories/presentation/components/story_item.dart';

class StoryList extends StatelessWidget {

  final List<Story> stories;
  final bool isLoading;

  const StoryList({
    super.key,
    required this.stories,
    required this.isLoading
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: isLoading ? 4 : stories.length + 1,
        separatorBuilder: (BuildContext context, int index) => 16.pw,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? CreateStoryWidget(cubitContext: context,)
              :
          isLoading ? ShimmerItem(
            width: 125,
            height: 200,
            radius: 16,
          )
              :
          StoryItem(story: stories[index - 1]);
        },
      ),
    );
  }
}
