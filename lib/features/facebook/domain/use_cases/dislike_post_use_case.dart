import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class DislikePostUseCase {

  final FacebookRepository repository;
  DislikePostUseCase(this.repository);

  Future<Either<Failure, void>> call(int postId) async {
    return repository.dislikePost(postId);
  }
}