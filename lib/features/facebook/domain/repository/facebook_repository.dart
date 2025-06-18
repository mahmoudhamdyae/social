import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';

import '../models/post.dart';

abstract class FacebookRepository {

  Future<Either<Failure, List<Post>>> getPosts();
}