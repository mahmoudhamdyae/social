import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/stories/data/data_source/stories_remote_data_source.dart';
import 'package:social/features/stories/data/repository/story_repository_impl.dart';
import 'package:social/features/stories/domain/repository/stories_repository.dart';
import 'package:social/features/stories/domain/use_cases/add_story_use_case.dart';
import 'package:social/features/stories/domain/use_cases/get_stories_use_case.dart';

import 'di.dart';

Future<void> storiesModule() async {

  /// Remote Data Source
  instance.registerLazySingleton<StoriesRemoteDataSource>(() => StoriesRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  ));

  /// Repository
  instance.registerLazySingleton<StoriesRepository>(() => StoryRepositoryImpl(
    instance<StoriesRemoteDataSource>(),

  ));

  /// Use Cases
  instance.registerLazySingleton<GetStoriesUseCase>(() => GetStoriesUseCase(
    instance<StoriesRepository>(),
  ));
  instance.registerLazySingleton<AddStoryUseCase>(() => AddStoryUseCase(
    instance<StoriesRepository>(),
  ));
}