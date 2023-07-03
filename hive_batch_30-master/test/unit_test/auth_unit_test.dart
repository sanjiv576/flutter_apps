// Step auth_unit test 2

// generate fake class of AuthUsecase
// ===> Why AuthUsecase, because it calls acutal networks , so AuthUsecase is mocked
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  // also generat mock class for BuildContext because it is required in loginStudent method of AuthUseCase
  MockSpec<BuildContext>()
])

// Step auth_unit test 3 :
// run this command to generate mock file for authusecase--> dart run build_runner build --delete-conflicting-outputs
void main() {
  // actual classes
  late AuthUseCase mockAuthUsecase;
  late BuildContext mockBuildContext;
  // Note: ProviderScope only can be used where the widget is
  // so we use ProviderContainer instead ProviderScope
  late ProviderContainer container;

  setUpAll(() {
    mockAuthUsecase = MockAuthUseCase();
    mockBuildContext = MockBuildContext();

    container = ProviderContainer(
      // should override authViewModelProvider by creating fake auth use case i.e MockAuthUseCase instead of AuthUaseCase

      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUsecase),
        ),
      ],
    );
  });

  test('check auth inital state i.e whether the isLoading is false or not', () {
    // initialize the authState because it is used in viewmodel
    final authState = container.read(authViewModelProvider);

// check isLoading, null image name, no error
    expect(authState.isLoading, false);
    expect(authState.imageName, isNull);
    expect(authState.error, isNull);
  });

  test('login with valid credentials', () async {
    // step 1 use when, whenever the loginStudent function is called,
    // then the provided username and password is valid
    when(mockAuthUsecase.loginStudent('sanjiv', 'sanjiv123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    // step 2 send testing username and password by calling the loginStudent function
    // NOte: step 2 calls step 1
    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(mockBuildContext, 'sanjiv', 'sanjiv123');

    final authState = container.read(authViewModelProvider);
    // verify
    expect(authState.error, isNull);
  });

  test('login with invalid credentials', () async {
    // faking invalid username and password
    when(mockAuthUsecase.loginStudent('sanjiv', 'sanjiv123'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

// send invalid username and invalid password
    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(mockBuildContext, 'sanjiv', 'sanjiv123');

    final authState = container.read(authViewModelProvider);
    expect(authState.error, 'Invalid');
  });

  tearDownAll(() => container.dispose());
}
