import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';
import 'package:social/features/tiktok/domain/models/video.dart';

abstract class TiktokRepository {
  Future<Either<Failure, List<Video>>> getVideos();
}