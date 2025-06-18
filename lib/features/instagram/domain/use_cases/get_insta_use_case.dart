import 'package:dartz/dartz.dart';
import 'package:social/features/instagram/domain/models/insta.dart';
import 'package:social/features/instagram/domain/repository/insta_repository.dart';

import '../../../../core/error/failure.dart';

class GetInstaUseCase {

  final InstaRepository _repository;
  GetInstaUseCase(this._repository);

  Future<Either<Failure, List<Insta>>> call() async {
    return _repository.getInsta();
  }
}