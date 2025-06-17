import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/facebook/data/entities/post_entity.dart';

import '../../../../core/error/exceptions.dart';

abstract class FacebookRemoteDataSource {

  Future<List<PostEntity>> getPosts();
  Future<void> addComment(String comment);
  Future<void> likePost(int postId);
  Future<void> dislikePost(int postId);

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

  Future addNote(String? title, String? description, String? imageUrl) async {
    return await postsRef.add({
      "title": title,
      "note": description,
      "imageUrl": imageUrl,
    });
  }

  Future<void> delNote(String noteId) async {
    return postsRef.doc(noteId).delete();
  }

  Future updateNote(String noteId, String? title, String? description, String? imageUrl) async {
    if (imageUrl == null) {
      return await postsRef.doc(noteId).update({
        "title": title,
        "note": description,
      });
    } else {
      return await postsRef.doc(noteId).update({
        "title": title,
        "note": description,
        "imageUrl": imageUrl,
      });
    }
  }

  @override
  Future<void> addComment(String comment) async {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<void> likePost(int postId) async {
    // TODO: implement likePost
    throw UnimplementedError();
  }

  @override
  Future<void> dislikePost(int postId) async {
    // TODO: implement dislikePost
    throw UnimplementedError();
  }
}