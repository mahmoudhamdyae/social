import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/error_screen.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/comments/presentation/cubit/comments_cubit.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: (MediaQuery.paddingOf(context).top).ph),
        SliverToBoxAdapter(
          child: BlocProvider<StoriesCubit>(
            create: (BuildContext context) => StoriesCubit.getInstance()..getStories(),
            child: BlocBuilder<StoriesCubit, StoriesState>(
              buildWhen: (prev, curr) =>
                  curr is LoadingGetStoriesState ||
                  curr is ErrorGetStoriesState ||
                  curr is SuccessGetStoriesState,
              builder: (context, state) {
                return SizedBox(
                  height: 200,
                  child: state is SuccessGetStoriesState
                      ? StoryList(stories: state.stories)
                      : const SizedBox(),
                );
              },
            ),
          ),
        ),
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => FacebookCubit.getInstance()..getPosts()),
            BlocProvider(create: (_) => CommentsCubit.getInstance()),
          ],
          child: BlocBuilder<FacebookCubit, FacebookStates>(
            buildWhen: (prev, curr) =>
                curr is LoadingGetPostsState ||
                curr is ErrorGetPostsState ||
                curr is SuccessGetPostsState,
            builder: (context, state) {
              return state is LoadingGetPostsState
                  ? SliverToBoxAdapter(child: LoadingScreen())
                  : state is ErrorGetPostsState
                      ? SliverToBoxAdapter(
                          child: ErrorScreen(
                              errorMessage: state.errorMessage ?? ''))
                      : state is SuccessGetPostsState
                          ? PostsList(posts: state.posts)
                          : const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ),
      ],
    );
  }
}
