import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';
import 'package:social/features/tiktok/data/data_source/tiktok_remote_data_source.dart';
import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:social/features/tiktok/domain/repository/tiktok_repository.dart';

import '../../../../core/error/exceptions.dart';

class TiktokRepositoryImpl extends TiktokRepository {

  final TiktokRemoteDataSource _remoteDataSource;
  TiktokRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Video>>> getVideos() async {
    try {
      final result = await _remoteDataSource.getVideos();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}