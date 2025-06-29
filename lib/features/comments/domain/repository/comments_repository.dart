import 'package:dartz/dartz.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/core/error/failure.dart';

import '../models/comment.dart';

abstract class CommentsRepository {

  Future<Either<Failure, List<Comment>>> getComments(String postId, PostType type);
  Future<Either<Failure, void>> addComment(String comment, String postId, PostType type);
  Future<Either<Failure, void>> like(String postId, PostType type);
  Future<Either<Failure, void>> dislike(String postId, PostType type);
}