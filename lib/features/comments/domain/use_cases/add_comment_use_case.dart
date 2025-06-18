import 'package:dartz/dartz.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';

import '../../../../core/enums/post_type.dart';
import '../../../../core/error/failure.dart';

class AddCommentUseCase {

  final CommentsRepository _repository;
  AddCommentUseCase(this._repository);

  Future<Either<Failure, void>> call(String comment, int postId, PostType type) async {
    return _repository.addComment(comment, postId, type);
  }
}