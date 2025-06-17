import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/facebook/data/entities/comment_entity.dart';
import 'package:social/features/facebook/data/entities/post_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';

abstract class FacebookRemoteDataSource {

  Future<List<PostEntity>> getPosts();
  Future<List<CommentEntity>> getComments(int postId);
  Future<void> addComment(String comment, int postId);
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

  @override
  Future<List<CommentEntity>> getComments(int postId) async {
    List<CommentEntity> comments = [];
    try {
      await postsRef
          .doc('$postId')
          .collection('comments')
          .orderBy('timestamp', descending: true)
          .get().then((event) {
        for (var doc in event.docs) {
          comments.add(CommentEntity.fromJson(doc.data()));
        }
      });
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
    return comments;
  }

  @override
  Future<void> addComment(String comment, int postId) async {
    await postsRef.doc('$postId').collection('comments').add(CommentEntity(
      id: Uuid().v4(),
      userName: 'Anonymous',
      userImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3560&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      comment: comment,
    ).toJson());
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