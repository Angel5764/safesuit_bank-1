class UserHomeState {
  final bool isLoading;
  final String userName;
  final String userEmail;
  final String error;

  UserHomeState({
    required this.isLoading,
    required this.userName,
    required this.userEmail,
    required this.error,
  });

  factory UserHomeState.initial() {
    return UserHomeState(
      isLoading: false,
      userName: '',
      userEmail: '',
      error: '',
    );
  }

  UserHomeState copyWith({
    bool? isLoading,
    String? userName,
    String? userEmail,
    String? error,
  }) {
    return UserHomeState(
      isLoading: isLoading ?? this.isLoading,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      error: error ?? this.error,
    );
  }
}
