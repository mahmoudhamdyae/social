import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/models/comment.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class GetCommentsUseCase {

  final FacebookRepository repository;
  GetCommentsUseCase(this.repository);

  Future<Either<Failure, List<Comment>>> call(int postId) async {
    return repository.getComments(postId);
  }
}