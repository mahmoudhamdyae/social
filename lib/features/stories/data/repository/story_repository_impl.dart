import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';
import 'package:social/features/stories/data/data_source/stories_remote_data_source.dart';
import 'package:social/features/stories/domain/repository/stories_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/models/story.dart';

class StoryRepositoryImpl extends StoriesRepository {

  final StoriesRemoteDataSource _remoteDataSource;
  StoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Story>>> getStories() async {
    try {
      final result = await _remoteDataSource.getStories();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addStory(File image) async {
    try {
      await _remoteDataSource.addStory(image);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}