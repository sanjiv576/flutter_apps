// Step : 8camera

class AuthState {
  final bool isLoading;
  final String? error;
// Step : 8camera  --> added this
  final String? imageName;

  AuthState({required this.isLoading, this.error, this.imageName});

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      // Step : 8camera  --> added this
      imageName: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
  }) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        imageName: imageName ?? this.imageName);
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
