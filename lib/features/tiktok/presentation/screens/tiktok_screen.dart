import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/screens/error_screen.dart';
import 'package:social/core/components/screens/loading_screen.dart';
import 'package:social/features/tiktok/presentation/components/tiktok_list.dart';
import 'package:social/features/tiktok/presentation/cubit/tiktok_cubit.dart';
import 'package:social/features/tiktok/presentation/cubit/tiktok_states.dart';

import '../../../comments/presentation/cubit/comments_cubit.dart';

class TiktokScreen extends StatelessWidget {
  const TiktokScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TiktokCubit.getInstance()..getVideos()),
        BlocProvider(create: (_) => CommentsCubit.getInstance()),
      ],
      child: BlocBuilder<TiktokCubit, TiktokState>(
        buildWhen: (previous, current) =>
            current is LoadingGetVideosState ||
            current is ErrorGetVideosState ||
            current is SuccessGetVideosState,
        builder: (BuildContext context, TiktokState state) {
          return state is ErrorGetVideosState ? ErrorScreen(errorMessage: state.errorMessage)
          :
              state is SuccessGetVideosState ?
          TiktokList(videos: state.videos) : LoadingScreen();
        }
      ),
    );
  }
}
