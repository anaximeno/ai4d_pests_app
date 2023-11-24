enum LoadingState {
  loading,
  stopped,
}

extension LoadingStateControl on LoadingState {
  bool isLoading() => this == LoadingState.loading;

  bool isStopped() => this == LoadingState.stopped;
}
