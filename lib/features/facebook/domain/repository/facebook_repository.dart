import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';

import '../models/comment.dart';
import '../models/post.dart';

abstract class FacebookRepository {

  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, List<Comment>>> getComments(int postId);
  Future<Either<Failure, void>> addComment(String comment, int postId);
  Future<Either<Failure, void>> likePost(int postId);
  Future<Either<Failure, void>> dislikePost(int postId);
}