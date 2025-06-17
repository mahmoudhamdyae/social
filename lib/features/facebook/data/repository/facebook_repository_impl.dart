import 'package:dartz/dartz.dart';

import 'package:social/core/error/failure.dart';

import 'package:social/features/facebook/domain/models/post.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/models/comment.dart';
import '../../domain/repository/facebook_repository.dart';
import '../data_source/facebook_remote_data_source.dart';

class FacebookRepositoryImpl implements FacebookRepository {

  final FacebookRemoteDataSource _remoteDataSource;
  FacebookRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final result = await _remoteDataSource.getPosts();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) async {
    try {
      final result = await _remoteDataSource.getComments(postId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(String comment, int postId) async {
    try {
      await _remoteDataSource.addComment(comment, postId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> likePost(int postId) async {
    try {
      await _remoteDataSource.likePost(postId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> dislikePost(int postId) async {
    try {
      await _remoteDataSource.dislikePost(postId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}