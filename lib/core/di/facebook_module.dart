import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/facebook/data/data_source/facebook_remote_data_source.dart';
import 'package:social/features/facebook/data/repository/facebook_repository_impl.dart';
import 'package:social/features/facebook/domain/repository/facebook_repository.dart';
import 'package:social/features/facebook/domain/use_cases/get_posts_use_case.dart';

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
}