import 'package:dartz/dartz.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';

import '../../../../core/error/failure.dart';

class AddCommentUseCase {

  final FacebookRepository repository;
  AddCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(String comment) async {
    return repository.addComment(comment);
  }
}