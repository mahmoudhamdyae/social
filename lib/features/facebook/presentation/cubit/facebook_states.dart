import '../../domain/models/post.dart';

abstract class FacebookStates {
  const FacebookStates();
}

/// Get Posts States
class LoadingGetPostsState extends FacebookStates {
  const LoadingGetPostsState();
}
class ErrorGetPostsState extends FacebookStates {
  final String? errorMessage;
  const ErrorGetPostsState(this.errorMessage);
}
class SuccessGetPostsState extends FacebookStates {
  final List<Post> posts;
  const SuccessGetPostsState(this.posts);
}