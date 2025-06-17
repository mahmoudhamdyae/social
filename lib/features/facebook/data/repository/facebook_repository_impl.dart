import 'package:dartz/dartz.dart';

import 'package:social/core/error/failure.dart';

import 'package:social/features/facebook/domain/models/post.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/facebook_repository.dart';
import '../data_source/facebook_remote_data_source.dart';

class FacebookRepositoryImpl implements FacebookRepository {

  final FacebookRemoteDataSource remoteDataSource;
  FacebookRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final result = await remoteDataSource.getPosts();
      return  Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(String comment) async {
    try {
      await remoteDataSource.addComment(comment);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> likePost(int postId) async {
    try {
      await remoteDataSource.likePost(postId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> dislikePost(int postId) async {
    try {
      await remoteDataSource.dislikePost(postId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}