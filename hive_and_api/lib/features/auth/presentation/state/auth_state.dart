class AuthState {
  final bool isLoading;
  final String? error;

  AuthState({
    required this.isLoading,
    this.error,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
