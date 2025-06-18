import 'package:dartz/dartz.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';
import 'package:social/features/facebook/domain/models/comment.dart';

import '../../../../core/error/failure.dart';

class GetCommentsUseCase {

  final CommentsRepository _repository;
  GetCommentsUseCase(this._repository);

  Future<Either<Failure, List<Comment>>> call(String postId, PostType type) async {
    return _repository.getComments(postId, type);
  }
}