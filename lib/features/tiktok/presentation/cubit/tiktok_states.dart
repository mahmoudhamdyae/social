import 'package:social/features/tiktok/domain/models/video.dart';

abstract class TiktokState {
  const TiktokState();
}

/// Get Videos States
class LoadingGetVideosState extends TiktokState {
  const LoadingGetVideosState();
}
class ErrorGetVideosState extends TiktokState {
  final String errorMessage;
  const ErrorGetVideosState(this.errorMessage);
}
class SuccessGetVideosState extends TiktokState {
  final List<Video> videos;
  const SuccessGetVideosState(this.videos);
}