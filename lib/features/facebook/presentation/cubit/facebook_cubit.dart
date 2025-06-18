import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/features/facebook/domain/use_cases/get_posts_use_case.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';

class FacebookCubit extends Cubit<FacebookStates> {

  final GetPostsUseCase _getPostsUseCase;

  FacebookCubit._(
      this._getPostsUseCase,
      ) : super(LoadingGetPostsState());

  static FacebookCubit getInstance() => FacebookCubit._(
    instance.get<GetPostsUseCase>(),
  );

  void getPosts() {
    emit(LoadingGetPostsState());
    getPostsWithoutLoading();
  }

  void getPostsWithoutLoading() {
    _getPostsUseCase.call().then((response) {
      response.fold((error) {
        emit(ErrorGetPostsState(error.message));
      }, (posts) {
        emit(SuccessGetPostsState(posts));
      });
    });
  }
}