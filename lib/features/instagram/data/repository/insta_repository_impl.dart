import 'package:dartz/dartz.dart';

import 'package:social/core/error/failure.dart';

import 'package:social/features/instagram/domain/models/insta.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/insta_repository.dart';
import '../data_source/insta_remote_data_source.dart';

class InstaRepositoryImpl implements InstaRepository {

  final InstaRemoteDataSource _remoteDataSource;
  InstaRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Insta>>> getInsta() async {
    try {
      final result = await _remoteDataSource.getInsta();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}