import 'package:dartz/dartz.dart';
import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:social/features/tiktok/domain/repository/tiktok_repository.dart';

import '../../../../core/error/failure.dart';

class GetVideosUseCase {

  final TiktokRepository _repository;
  GetVideosUseCase(this._repository);

  Future<Either<Failure, List<Video>>> call() async {
    return _repository.getVideos();
  }
}