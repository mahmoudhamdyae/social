import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/features/tiktok/data/entities/video_entity.dart';

abstract class TiktokRemoteDataSource {
  Future<List<VideoEntity>> getVideos();

  final FirebaseFirestore db;
  TiktokRemoteDataSource(this.db);
}

class TiktokRemoteDataSourceImpl extends TiktokRemoteDataSource {

  late CollectionReference tiktokRef;

  TiktokRemoteDataSourceImpl(super.db) {
    tiktokRef = db.collection("tiktok");
  }
  
  @override
  Future<List<VideoEntity>> getVideos() async {
    List<VideoEntity> videos = [];
    await tiktokRef.get().then((event) {
      for (var doc in event.docs) {
        videos.add(VideoEntity.fromJson(doc.data()));
      }
    });
    return videos;
  }
}