import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerStudent(StudentEntity student) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerStudent(student);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        error: null,
      ),
    );
  }

  Future<bool> loginStudent(String username, String password) async {
    state = state.copyWith(isLoading: true);
    bool isLogin = false;
    var data = await _authUseCase.loginStudent(username, password);
    data.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.error),
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        isLogin = success;
      },
    );

    return isLogin;
  }
}

