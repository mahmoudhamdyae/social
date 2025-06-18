import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/features/comments/presentation/cubit/comments_state.dart';
import 'package:social/features/comments/domain/use_cases/dislike_use_case.dart';
import 'package:social/features/comments/domain/use_cases/get_comments_use_case.dart';

import '../../domain/use_cases/add_comment_use_case.dart';
import '../../domain/use_cases/like_use_case.dart';

class CommentsCubit extends Cubit<CommentsStates> {

  final GetCommentsUseCase _getCommentsUseCase;
  final AddCommentUseCase _addCommentUseCase;
  final LikeUseCase _likeUseCase;
  final DislikeUseCase _dislikeUseCase;

  CommentsCubit._(
      this._getCommentsUseCase,
      this._addCommentUseCase,
      this._likeUseCase,
      this._dislikeUseCase
      ) : super(LoadingGetCommentsState());

  final TextEditingController addCommentController = TextEditingController();

  @override
  Future<void> close() async {
    addCommentController.dispose();
    return super.close();
  }

  static CommentsCubit getInstance() => CommentsCubit._(
    instance.get<GetCommentsUseCase>(),
    instance.get<AddCommentUseCase>(),
    instance.get<LikeUseCase>(),
    instance.get<DislikeUseCase>(),
  );

  int? postId;

  void getComments(int postId, PostType type) {
    if (this.postId != postId) {
      this.postId = postId;
      emit(LoadingGetCommentsState());
    }
    _getComments(postId, type);
  }

  Future<void> _getComments(int postId, PostType type) async {
     await _getCommentsUseCase.call(postId, type).then((response) {
      response.fold((error) {
        emit(ErrorGetCommentsState(error.message));
      }, (comments) {
        emit(SuccessGetCommentsState(comments));
      });
    });
  }

  void addComment(int postId, PostType type) {
    this.postId = postId;
    emit(LoadingAddCommentState());
    _addCommentUseCase.call(addCommentController.text, postId, type).then((response) {
      response.fold((error) {
        emit(ErrorAddCommentState(error.message));
      }, (_) async {
        emit(SuccessAddCommentState());
        addCommentController.clear();
        await _getComments(postId, type);
      });
    });
  }

  void likePost(String postId, PostType type, Function() getPosts) {
    emit(LoadingLikeState());
    _likeUseCase.call(postId, type).then((response) {
      response.fold((error) {
        emit(ErrorLikeState(error.message));
      }, (_) {
        emit(SuccessLikeState());
        getPosts();
      });
    });
  }

  void dislikePost(String postId, PostType type, Function() getPosts) {
    emit(LoadingDislikeState());
    _dislikeUseCase.call(postId, type).then((response) {
      response.fold((error) {
        emit(ErrorDislikeState(error.message));
      }, (_) {
        emit(SuccessDislikeState());
        getPosts();
      });
    });
  }
}