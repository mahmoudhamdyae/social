import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class GetCommentsUseCase {

  final FacebookRepository _repository;
  GetCommentsUseCase(this._repository);

  Future<Either<Failure, List<Comment>>> call(int postId) async {
    return _repository.getComments(postId);
  }
}