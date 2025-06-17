import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';

import '../models/post.dart';

abstract class FacebookRepository {

  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, void>> addComment(String comment);
  Future<Either<Failure, void>> likePost(int postId);
  Future<Either<Failure, void>> dislikePost(int postId);
}