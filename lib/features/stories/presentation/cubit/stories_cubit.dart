import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/features/stories/domain/use_cases/add_story_use_case.dart';
import 'package:social/features/stories/domain/use_cases/get_stories_use_case.dart';
import 'package:social/features/stories/presentation/cubit/stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {

  final GetStoriesUseCase _getStoriesUseCase;
  final AddStoryUseCase _addStoryUseCase;

  StoriesCubit._(
      this._getStoriesUseCase,
      this._addStoryUseCase
      ) : super(LoadingGetStoriesState());

  static StoriesCubit getInstance() => StoriesCubit._(
    instance.get<GetStoriesUseCase>(),
    instance.get<AddStoryUseCase>(),
  );

  void getStories() {
    emit(LoadingGetStoriesState());
    _getStories();
  }

  void _getStories() {
    _getStoriesUseCase.call().then((response) {
      response.fold((error) {
        emit(ErrorGetStoriesState(error.message));
      }, (stories) {
        emit(SuccessGetStoriesState(stories));
      });
    });
  }

  void addStory(File image) {
    emit(LoadingAddStoryState());
    _addStoryUseCase.call(image).then((response) {
      response.fold((error) {
        emit(ErrorAddStoryState(error.message));
      }, (_) {
        emit(SuccessAddStoryState());
        _getStories();
      });
    });
  }
}