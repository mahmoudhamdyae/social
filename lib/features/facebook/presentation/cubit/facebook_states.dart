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

/// Add Comment States
class LoadingAddCommentState extends FacebookStates {
  const LoadingAddCommentState();
}
class ErrorAddCommentState extends FacebookStates {
  final String? errorMessage;
  const ErrorAddCommentState(this.errorMessage);
}
class SuccessAddCommentState extends FacebookStates {
  const SuccessAddCommentState();
}

/// Like Post States
class LoadingLikePostState extends FacebookStates {
  const LoadingLikePostState();
}
class ErrorLikePostState extends FacebookStates {
  final String? errorMessage;
  const ErrorLikePostState(this.errorMessage);
}
class SuccessLikePostState extends FacebookStates {
  const SuccessLikePostState();
}

/// Dislike Post States
class LoadingDislikePostState extends FacebookStates {
  const LoadingDislikePostState();
}
class ErrorDislikePostState extends FacebookStates {
  final String? errorMessage;
  const ErrorDislikePostState(this.errorMessage);
}
class SuccessDislikePostState extends FacebookStates {
  const SuccessDislikePostState();
}