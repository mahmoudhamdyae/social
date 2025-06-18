import 'package:dartz/dartz.dart';

import 'package:social/core/error/failure.dart';
import 'package:social/features/comments/data/data_source/comments_remote_data_source.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';

import '../../../../core/enums/post_type.dart';
import '../../../../core/error/exceptions.dart';
import '../../../facebook/domain/models/comment.dart';

class CommentsRepositoryImpl implements CommentsRepository {

  final CommentsRemoteDataSource _remoteDataSource;
  CommentsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Comment>>> getComments(String postId, PostType type) async {
    try {
      final result = await _remoteDataSource.getComments(postId, type);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(String comment, String postId, PostType type) async {
    try {
      await _remoteDataSource.addComment(comment, postId, type);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> like(String postId, PostType type) async {
    try {
      await _remoteDataSource.like(postId, type);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> dislike(String postId, PostType type) async {
    try {
      await _remoteDataSource.dislike(postId, type);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}