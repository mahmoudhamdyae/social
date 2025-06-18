import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/core/enums/post_type.dart';
import 'package:social/features/facebook/data/entities/comment_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';

abstract class CommentsRemoteDataSource {

  Future<List<CommentEntity>> getComments(int postId, PostType type);
  Future<void> addComment(String comment, int postId, PostType type);
  Future<void> like(String postId, PostType type);
  Future<void> dislike(String postId, PostType type);

  final FirebaseFirestore db;
  CommentsRemoteDataSource(this.db);
}

class CommentsRemoteDataSourceImpl extends CommentsRemoteDataSource {

  CommentsRemoteDataSourceImpl(super.db);

  @override
  Future<List<CommentEntity>> getComments(int postId, PostType type) async {
    List<CommentEntity> comments = [];
    try {
      CollectionReference postsRef = db.collection(type.title);
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
  Future<void> addComment(String comment, int postId, PostType type) async {
    try {
      CollectionReference postsRef = db.collection(type.title);
      await postsRef.doc('$postId').collection('comments').add(CommentEntity(
        id: Uuid().v4(),
        userName: 'Anonymous',
        userImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3560&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        comment: comment,
      ).toJson());
      await postsRef.doc('$postId').update({type.commentNo : FieldValue.increment(1)});
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }

  @override
  Future<void> like(String postId, PostType type) async {
    try {
      print('-----A------ $postId');
      CollectionReference postsRef = db.collection(type.title);
      await postsRef.doc(postId).update({type.likesNo : FieldValue.increment(1)});
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }

  @override
  Future<void> dislike(String postId, PostType type) async {
    try {
      CollectionReference postsRef = db.collection(type.title);
      await postsRef.doc(postId).update({type.likesNo : FieldValue.increment(-1)});
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }
}