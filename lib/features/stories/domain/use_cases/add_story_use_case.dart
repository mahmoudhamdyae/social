import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social/features/stories/domain/repository/stories_repository.dart';

import '../../../../core/error/failure.dart';

class AddStoryUseCase {

  final StoriesRepository _repository;
  AddStoryUseCase(this._repository);

  Future<Either<Failure, void>> call(File image) async {
    return _repository.addStory(image);
  }
}