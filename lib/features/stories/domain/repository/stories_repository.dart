import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social/core/error/failure.dart';

import '../models/story.dart';

abstract class StoriesRepository {

  Future<Either<Failure, List<Story>>> getStories();
  Future<Either<Failure, void>> addStory(File image);
}