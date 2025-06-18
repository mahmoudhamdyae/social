import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/facebook/data/entities/post_entity.dart';

import '../../../../core/error/exceptions.dart';

abstract class FacebookRemoteDataSource {

  Future<List<PostEntity>> getPosts();

  final FirebaseFirestore db;
  FacebookRemoteDataSource(this.db);
}

class FacebookRemoteDataSourceImpl extends FacebookRemoteDataSource {

  late CollectionReference postsRef;

  FacebookRemoteDataSourceImpl(super.db) {
    postsRef = db.collection("facebook");
  }


  @override
  Future<List<PostEntity>> getPosts() async {
    List<PostEntity> posts = [];
    try {
      await postsRef.get().then((event) {
        for (var doc in event.docs) {
          posts.add(PostEntity.fromJson(doc.data()));
        }
      });
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
    return posts;
  }
}