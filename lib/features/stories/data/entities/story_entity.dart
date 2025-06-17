import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/stories/domain/models/story.dart';

class StoryEntity extends Story {
  StoryEntity({super.id, super.image, super.userName, super.userImage});

  factory StoryEntity.fromJson(dynamic json) {
    return StoryEntity(
      id: json['id'],
      image: json['image'],
      userName: json['user_name'],
      userImage: json['user_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'user_name': userName,
      'user_image': userImage,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}