import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/tiktok/data/data_source/tiktok_remote_data_source.dart';
import 'package:social/features/tiktok/data/repository/tiktok_repository_impl.dart';
import 'package:social/features/tiktok/domain/repository/tiktok_repository.dart';
import 'package:social/features/tiktok/domain/use_cases/get_videos_use_case.dart';

import 'di.dart';

Future<void> tiktokModule() async {

  /// Remote Data Source
  instance.registerLazySingleton<TiktokRemoteDataSource>(() => TiktokRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  ));

  /// Repository
  instance.registerLazySingleton<TiktokRepository>(() => TiktokRepositoryImpl(
    instance<TiktokRemoteDataSource>(),

  ));

  /// Use Cases
  instance.registerLazySingleton<GetVideosUseCase>(() => GetVideosUseCase(
    instance<TiktokRepository>(),
  ));
}