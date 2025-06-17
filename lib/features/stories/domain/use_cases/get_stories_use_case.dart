import 'package:dartz/dartz.dart';
import 'package:social/features/stories/domain/models/story.dart';
import 'package:social/features/stories/domain/repository/stories_repository.dart';

import '../../../../core/error/failure.dart';

class GetStoriesUseCase {

  final StoriesRepository _repository;
  GetStoriesUseCase(this._repository);

  Future<Either<Failure, List<Story>>> call() async {
    return _repository.getStories();
  }
}