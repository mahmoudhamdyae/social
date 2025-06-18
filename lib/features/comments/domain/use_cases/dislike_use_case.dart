import 'package:dartz/dartz.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';

import '../../../../core/error/failure.dart';

class DislikeUseCase {

  final CommentsRepository _repository;
  DislikeUseCase(this._repository);

  Future<Either<Failure, void>> call(int postId, PostType type) async {
    return _repository.dislike(postId, type);
  }
}