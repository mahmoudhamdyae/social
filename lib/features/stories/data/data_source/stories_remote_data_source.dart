import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social/features/stories/data/entities/story_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';

abstract class StoriesRemoteDataSource {

  Future<List<StoryEntity>> getStories();
  Future<void> addStory(File image);

  final FirebaseFirestore db;
  StoriesRemoteDataSource(this.db);
}

class StoriesRemoteDataSourceImpl extends StoriesRemoteDataSource {

  late CollectionReference storiesRef;

  StoriesRemoteDataSourceImpl(super.db) {
    storiesRef = db.collection("stories");
  }


  @override
  Future<List<StoryEntity>> getStories() async {
    List<StoryEntity> stories = [];
    try {
      await storiesRef.orderBy('timestamp', descending: true).get().then((event) {
        for (var doc in event.docs) {
          stories.add(StoryEntity.fromJson(doc.data()));
        }
      });
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
    return stories;
  }

  @override
  Future<void> addStory(File image) async {
    try {

      final String storyId = Uuid().v4();
      final String imagePath = 'stories/$storyId.jpg';

      // Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(imagePath);
      final uploadTask = await storageRef.putFile(image);

      // Get download URL
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Save story data to Firestore
      await storiesRef.doc(storyId).set(
        StoryEntity(
          id: storyId,
          userName: 'Anonymous',
          userImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3560&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          image: imageUrl,
        ).toJson(),
      );









      
      // await storiesRef.doc(Uuid().v4()).collection('comments').add(StoryEntity(
      //   id: Uuid().v4(),
      //   userName: 'Anonymous',
      //   userImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3560&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      //   image: 'comment',
      // ).toJson());
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }
}