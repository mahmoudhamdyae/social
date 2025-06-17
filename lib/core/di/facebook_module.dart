import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/facebook/data/data_source/facebook_remote_data_source.dart';
import 'package:social/features/facebook/data/repository/facebook_repository_impl.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';
import 'package:social/features/facebook/domain/use_cases/add_comment_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/dislike_post_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/get_posts_use_case.dart';
import 'package:social/features/facebook/domain/use_cases/like_post_use_case.dart';

import 'di.dart';

Future<void> facebookModule() async {

  /// Remote Data Source
  instance.registerLazySingleton<FacebookRemoteDataSource>(() => FacebookRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  ));

  /// Repository
  instance.registerLazySingleton<FacebookRepository>(() => FacebookRepositoryImpl(
    instance<FacebookRemoteDataSource>(),

  ));

  /// Use Cases
  instance.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(
    instance<FacebookRepository>(),
  ));
  instance.registerLazySingleton<AddCommentUseCase>(() => AddCommentUseCase(
    instance<FacebookRepository>(),
  ));
  instance.registerLazySingleton<LikePostUseCase>(() => LikePostUseCase(
    instance<FacebookRepository>(),
  ));
  instance.registerLazySingleton<DislikePostUseCase>(() => DislikePostUseCase(
    instance<FacebookRepository>(),
  ));
}