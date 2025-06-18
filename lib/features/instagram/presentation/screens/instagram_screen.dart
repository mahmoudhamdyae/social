import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/features/instagram/presentation/cubit/insta_cubit.dart';
import 'package:social/features/instagram/presentation/cubit/insta_states.dart';

import '../../../../core/components/screens/error_screen.dart';
import '../../../../core/components/screens/loading_screen.dart';
import '../../../comments/presentation/cubit/comments_cubit.dart';
import '../components/insta_list.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InstaCubit.getInstance()..getInsta()),
        BlocProvider(create: (_) => CommentsCubit.getInstance()),
      ],
      child: BlocBuilder<InstaCubit, InstaStates>(
        buildWhen: (prev, curr) =>
        curr is LoadingGetInstaState ||
            curr is ErrorGetInstaState ||
            curr is SuccessGetInstaState,
        builder: (context, state) {
          return state is ErrorGetInstaState
              ? ErrorScreen(
                  errorMessage: state.errorMessage ?? '')
              : state is SuccessGetInstaState || state is LoadingGetInstaState
              ? InstaList(
              instas: state is SuccessGetInstaState ? state.insta : [],
            isLoading: state is LoadingGetInstaState,
          )
              : const SizedBox();
        },
      ),
    );
  }
}
