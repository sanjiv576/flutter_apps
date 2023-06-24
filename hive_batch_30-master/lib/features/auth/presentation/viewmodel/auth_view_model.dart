import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/router/app_route.dart';
import 'package:hive_and_api_for_class/core/common/snackbar/my_snackbar.dart';
import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

// NOte: Ui calls the functions of this class
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

  // never use Flutter code in viewmodel but for simplicity we used it

  Future<void> loginStudent(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    // bool isLogin = false;
    var data = await _authUseCase.loginStudent(username, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(context: context, message: failure.error);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(context, AppRoute.homeRoute);

        // isLogin = success;
      },
    );

    // return isLogin;
  }

// call this function when the images upload
  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.uploadProfilePictre(file!);

// left
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    },
        // right folod
        (imageName) {
      state =
          state.copyWith(isLoading: false, error: null, imageName: imageName);
    });
  }
}
