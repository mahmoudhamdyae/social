import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/error_screen.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentation/components/posts_list.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';
import 'package:social/features/stories/presentation/components/story_list.dart';
import 'package:social/features/stories/presentation/cubit/stories_cubit.dart';
import 'package:social/features/stories/presentation/cubit/stories_state.dart';

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.paddingOf(context).top).ph,
        SizedBox(
          height: 200,
          child: BlocProvider<StoriesCubit>(
            create: (BuildContext context) => StoriesCubit.getInstance()..getStories(),
            child: BlocBuilder<StoriesCubit, StoriesState>(
              buildWhen: (previous, current) =>
                  current is LoadingGetStoriesState ||
                  current is ErrorGetStoriesState ||
                  current is SuccessGetStoriesState,
              builder: (BuildContext context, StoriesState state) {
                return state is SuccessGetStoriesState ? StoryList(stories: state.stories)
                :
                    const SizedBox();
              },
            ),
          ),
        ),
        Expanded(
          child: BlocProvider<FacebookCubit>(
              create: (BuildContext context) => FacebookCubit.getInstance()..getPosts(),
              child: BlocBuilder<FacebookCubit, FacebookStates>(
                buildWhen: (previous, current) =>
                    current is LoadingGetPostsState ||
                    current is ErrorGetPostsState ||
                    current is SuccessGetPostsState,
                builder: (BuildContext context, FacebookStates state) {
                  return state is LoadingGetPostsState ? LoadingScreen()
                  :
                      state is ErrorGetPostsState ? ErrorScreen(errorMessage: state.errorMessage ?? '')
                  :
                  state is SuccessGetPostsState ?
                      PostsList(posts: state.posts)
                  : const SizedBox();
                },
              )
          ),
        ),
      ],
    );
  }
}
