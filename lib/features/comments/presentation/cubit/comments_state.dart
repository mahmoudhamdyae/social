import 'package:social/features/comments/domain/models/comment.dart';

abstract class CommentsStates {
  const CommentsStates();
}

/// Get Comments States
class LoadingGetCommentsState extends CommentsStates {
  const LoadingGetCommentsState();
}
class ErrorGetCommentsState extends CommentsStates {
  final String? errorMessage;
  const ErrorGetCommentsState(this.errorMessage);
}
class SuccessGetCommentsState extends CommentsStates {
  final List<Comment> comments;
  const SuccessGetCommentsState(this.comments);
}

/// Add Comment States
class LoadingAddCommentState extends CommentsStates {
  const LoadingAddCommentState();
}
class ErrorAddCommentState extends CommentsStates {
  final String? errorMessage;
  const ErrorAddCommentState(this.errorMessage);
}
class SuccessAddCommentState extends CommentsStates {
  const SuccessAddCommentState();
}

/// Like Post States
class LoadingLikeState extends CommentsStates {
  const LoadingLikeState();
}
class ErrorLikeState extends CommentsStates {
  final String? errorMessage;
  const ErrorLikeState(this.errorMessage);
}
class SuccessLikeState extends CommentsStates {
  const SuccessLikeState();
}

/// Dislike Post States
class LoadingDislikeState extends CommentsStates {
  const LoadingDislikeState();
}
class ErrorDislikeState extends CommentsStates {
  final String? errorMessage;
  const ErrorDislikeState(this.errorMessage);
}
class SuccessDislikeState extends CommentsStates {
  const SuccessDislikeState();
}