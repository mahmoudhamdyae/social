import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class AddCommentUseCase {

  final FacebookRepository _repository;
  AddCommentUseCase(this._repository);

  Future<Either<Failure, void>> call(String comment, int postId) async {
    return _repository.addComment(comment, postId);
  }
}