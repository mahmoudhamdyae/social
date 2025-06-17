import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/models/post.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class GetPostsUseCase {

  final FacebookRepository _repository;
  GetPostsUseCase(this._repository);

  Future<Either<Failure, List<Post>>> call() async {
    return _repository.getPosts();
  }
}