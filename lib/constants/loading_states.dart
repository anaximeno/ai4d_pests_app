enum LoadingState {
  loading,
  none,
}

extension LoadingStateControl on LoadingState {
  bool isLoading() => this == LoadingState.loading;

  bool isNone() => this == LoadingState.none;
}
