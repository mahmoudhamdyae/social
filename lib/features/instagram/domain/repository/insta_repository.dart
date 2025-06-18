import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';

import '../models/insta.dart';

abstract class InstaRepository {

  Future<Either<Failure, List<Insta>>> getInsta();
}