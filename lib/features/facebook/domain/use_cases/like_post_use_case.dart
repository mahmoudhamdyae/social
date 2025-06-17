import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class LikePostUseCase {

  final FacebookRepository _repository;
  LikePostUseCase(this._repository);

  Future<Either<Failure, void>> call(int postId) async {
    return _repository.likePost(postId);
  }
}