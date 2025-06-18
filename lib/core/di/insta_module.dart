import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/instagram/data/data_source/insta_remote_data_source.dart';
import 'package:social/features/instagram/data/repository/insta_repository_impl.dart';
import 'package:social/features/instagram/domain/repository/insta_repository.dart';
import 'package:social/features/instagram/domain/use_cases/get_insta_use_case.dart';

import 'di.dart';

Future<void> instaModule() async {

  /// Remote Data Source
  instance.registerLazySingleton<InstaRemoteDataSource>(() => InstaRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  ));

  /// Repository
  instance.registerLazySingleton<InstaRepository>(() => InstaRepositoryImpl(
    instance<InstaRemoteDataSource>(),

  ));

  /// Use Cases
  instance.registerLazySingleton<GetInstaUseCase>(() => GetInstaUseCase(
    instance<InstaRepository>(),
  ));
}