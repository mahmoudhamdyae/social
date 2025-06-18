import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/comments/data/data_source/comments_remote_data_source.dart';
import 'package:social/features/comments/domain/repository/comments_repository.dart';
import 'package:social/features/comments/domain/use_cases/add_comment_use_case.dart';
import 'package:social/features/comments/domain/use_cases/dislike_use_case.dart';
import 'package:social/features/comments/domain/use_cases/get_comments_use_case.dart';

import '../../features/comments/data/repository/comments_repository_impl.dart';
import '../../features/comments/domain/use_cases/like_use_case.dart';
import 'di.dart';

Future<void> commentsModule() async {

  /// Remote Data Source
  instance.registerLazySingleton<CommentsRemoteDataSource>(() => CommentsRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  ));

  /// Repository
  instance.registerLazySingleton<CommentsRepository>(() => CommentsRepositoryImpl(
    instance<CommentsRemoteDataSource>(),

  ));

  /// Use Cases
  instance.registerLazySingleton<GetCommentsUseCase>(() => GetCommentsUseCase(
    instance<CommentsRepository>(),
  ));
  instance.registerLazySingleton<AddCommentUseCase>(() => AddCommentUseCase(
    instance<CommentsRepository>(),
  ));
  instance.registerLazySingleton<LikeUseCase>(() => LikeUseCase(
    instance<CommentsRepository>(),
  ));
  instance.registerLazySingleton<DislikeUseCase>(() => DislikeUseCase(
    instance<CommentsRepository>(),
  ));
}