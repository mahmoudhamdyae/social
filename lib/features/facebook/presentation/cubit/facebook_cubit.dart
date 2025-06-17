import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/features/facebook/domain/use_cases/add_comment_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/dislike_post_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/get_posts_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/like_post_use_case.dart';
import 'package:social/features/facebook/presentation/cubit/facebook_states.dart';

class FacebookCubit extends Cubit<FacebookStates> {

  final GetPostsUseCase _getPostsUseCase;
  final AddCommentUseCase _addCommentUseCase;
  final LikePostUseCase _likePostUseCase;
  final DislikePostUseCase _dislikePostUseCase;

  FacebookCubit._(
      this._getPostsUseCase,
      this._addCommentUseCase,
      this._likePostUseCase,
      this._dislikePostUseCase
      ) : super(LoadingGetPostsState());

  final TextEditingController addCommentController = TextEditingController();

  static getInstance() => FacebookCubit._(
    instance.get<GetPostsUseCase>(),
    instance.get<AddCommentUseCase>(),
    instance.get<LikePostUseCase>(),
    instance.get<DislikePostUseCase>(),
  );

  void getPosts() {
    emit(LoadingGetPostsState());
    _getPostsUseCase.call().then((response) {
      response.fold((error) {
        emit(ErrorGetPostsState(error.message));
      }, (posts) {
        emit(SuccessGetPostsState(posts));
      });
    });
  }

  void addComment() {
    emit(LoadingAddCommentState());
    _addCommentUseCase.call(addCommentController.text).then((response) {
      response.fold((error) {
        emit(ErrorAddCommentState(error.message));
      }, (_) {
        emit(SuccessAddCommentState());
      });
    });
  }

  void likePost(int postId) {
    emit(LoadingLikePostState());
    _likePostUseCase.call(postId).then((response) {
      response.fold((error) {
        emit(ErrorLikePostState(error.message));
      }, (_) {
        emit(SuccessLikePostState());
      });
    });
  }

  void dislikePost(int postId) {
    emit(LoadingDislikePostState());
    _dislikePostUseCase.call(postId).then((response) {
      response.fold((error) {
        emit(ErrorDislikePostState(error.message));
      }, (_) {
        emit(SuccessDislikePostState());
      });
    });
  }
}