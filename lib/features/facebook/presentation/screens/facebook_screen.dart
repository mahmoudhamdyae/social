import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/features/facebook/presentation/components/posts_list.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_cubit.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FacebookCubit>(
        create: (BuildContext context) => FacebookCubit.getInstance()..getPosts(),
        child: BlocBuilder<FacebookCubit, FacebookStates>(
          buildWhen: (previous, current) =>
              current is LoadingGetPostsState ||
              current is ErrorGetPostsState ||
              current is SuccessGetPostsState,
          builder: (BuildContext context, FacebookStates state) {
            return state is LoadingGetPostsState ? LoadingScreen()
            :
            state is SuccessGetPostsState ?
                PostsList(posts: state.posts)
            : const SizedBox();
          },
        )
    );
  }
}
