import 'package:dartz/dartz.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';

import '../../../../core/error/failure.dart';

class LikeUseCase {

  final CommentsRepository _repository;
  LikeUseCase(this._repository);

  Future<Either<Failure, void>> call(String postId, PostType type) async {
    return _repository.like(postId, type);
  }
}