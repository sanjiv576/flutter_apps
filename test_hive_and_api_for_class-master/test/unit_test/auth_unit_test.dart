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
// Step auth - 1
// mocking AuthUseCase
@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),

  // later on BuildContexg is removed
  MockSpec<BuildContext>(),
])
void main() {
  // acutal class of authUsecase
  late AuthUseCase mockAuthUsecase;
  // holds all the state like ProviderScope
  late ProviderContainer container;

  late BuildContext context;

  // initilization of above properties
  // executes all the time whenever test starts
  setUpAll(() {
    mockAuthUsecase = MockAuthUseCase();
    // faking/mocking builcontext
    context = MockBuildContext();

    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
        (ref) => AuthViewModel(mockAuthUsecase),
      ),
    ]);
  });

  //command: dart run build_runner build --delete-conflicting-outputs

  test('check for the initial state', () async {
    // contianer is used here instead of ref beacuase here we are using ProviderContainer not ProviderScope
    final authState = container.read(authViewModelProvider);
    // 2 parameters: acutal and expected
    expect(authState.isLoading, false);
  });

  // testing login --> pass
  // NOte: before running this comment flutter code in viewmodel
  test('login test with valid username and password', () async {
    // jati kehaer yo func call hunca
    when(mockAuthUsecase.loginStudent('sanjiv', 'sanjiv123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(context, 'sanjiv', 'sanjiv123');

// read the state as the state is changed after calling
    final authState = container.read(authViewModelProvider);

// Note: if the error is null that means, given username and password is valid ==> go and see in loginStudent func of auth -> viewmodel
    expect(authState.error, isNull);
  });

  // testing login -- errror pass
  test('check for the initial state', () async {
    // contianer is used here instead of ref beacuase here we are using ProviderContainer not ProviderScope
    final authState = container.read(authViewModelProvider);
    // 2 parameters: acutal and expected
    expect(authState.isLoading, false);
  });

  // testing login
  // NOte: before running this comment flutter code in viewmodel
  test('login test with valid username and password', () async {
    // jati kehaer yo func call hunca
    when(mockAuthUsecase.loginStudent('sanjiv', 'sanjiv123'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(context, 'sanjiv', 'sanjiv123');

// read the state as the state is changed after calling
    final authState = container.read(authViewModelProvider);

// Note: if the error is null that means, given username and password is valid ==> go and see in loginStudent func of auth -> viewmodel
// method -1
    expect(authState.error, 'Invalid');
    // method -2
    // expect(authState.error, isNotNull);
  });

  // tear down
  // tearDownAll(() => container.dispose());
}
