enum ApiRequestState { idle, loading, success, error }

// https://stackoverflow.com/questions/38908285/how-do-i-add-methods-or-values-to-enums-in-dart
extension ApiRequestStateExtension on ApiRequestState {
  bool get isIdle => this == ApiRequestState.idle;
  bool get isLoading => this == ApiRequestState.loading;
  bool get isSuccess => this == ApiRequestState.success;
  bool get isError => this == ApiRequestState.error;
}
