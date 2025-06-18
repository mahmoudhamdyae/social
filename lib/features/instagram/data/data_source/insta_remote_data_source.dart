import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/instagram/data/entities/insta_entity.dart';

import '../../../../core/error/exceptions.dart';

abstract class InstaRemoteDataSource {

  Future<List<InstaEntity>> getInsta();

  final FirebaseFirestore db;
  InstaRemoteDataSource(this.db);
}

class InstaRemoteDataSourceImpl extends InstaRemoteDataSource {

  late CollectionReference postsRef;

  InstaRemoteDataSourceImpl(super.db) {
    postsRef = db.collection("instagram");
  }


  @override
  Future<List<InstaEntity>> getInsta() async {
    List<InstaEntity> posts = [];
    try {
      await postsRef.get().then((event) {
        for (var doc in event.docs) {
          posts.add(InstaEntity.fromJson(doc.data()));
        }
      });
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
    return posts;
  }
}