import '../../domain/models/story.dart';

abstract class StoriesState {
  const StoriesState();
}

/// Get Stories States
class LoadingGetStoriesState extends StoriesState {
  const LoadingGetStoriesState();
}
class ErrorGetStoriesState extends StoriesState {
  final String errorMessage;
  const ErrorGetStoriesState(this.errorMessage);
}
class SuccessGetStoriesState extends StoriesState {
  final List<Story> stories;
  const SuccessGetStoriesState(this.stories);
}

/// Add Story States
class LoadingAddStoryState extends StoriesState {
  const LoadingAddStoryState();
}
class ErrorAddStoryState extends StoriesState {
  final String errorMessage;
  const ErrorAddStoryState(this.errorMessage);
}
class SuccessAddStoryState extends StoriesState {
  const SuccessAddStoryState();
}