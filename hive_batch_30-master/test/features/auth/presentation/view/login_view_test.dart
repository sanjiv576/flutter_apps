import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/config/router/app_route.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_data/batch_entity_test.dart';
import '../../../../../test_data/course_entity_test.dart';
import '../../../../unit_test/auth_unit_test.mocks.dart';
import 'login_view_test.mocks.dart';

@GenerateNiceMocks([
  // no need to mock AuthUseCase because it is already done
  MockSpec<BatchUseCase>(),
  MockSpec<CourseUseCase>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late BatchUseCase mockBatchUsecase;
  late CourseUseCase mockCourseUseCase;

  // for getting batches and courses
  late List<BatchEntity> lstBatchEntity;
  late List<CourseEntity> lstCourseEntity;
  late bool isLogin;

  // initialization of above properties
  setUpAll(() async {
    mockAuthUsecase = MockAuthUseCase();
    mockBatchUsecase = MockBatchUseCase();
    mockCourseUseCase = MockCourseUseCase();

    lstBatchEntity = await getBatchListTest();
    lstCourseEntity = await getCourseListTest();

    isLogin = true;
  });

  testWidgets('login test with username and password and open dashboard',
      (tester) async {
    when(mockAuthUsecase.loginStudent('sanjiv', 'sanjiv123'))
        .thenAnswer((_) async => Right(isLogin));

    when(mockBatchUsecase.getAllBatches())
        .thenAnswer((_) async => Right(lstBatchEntity));

    when(mockCourseUseCase.getAllCourses())
        .thenAnswer((_) async => Right(lstCourseEntity));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // override the AuthUseCase with mockAuthUseCase
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUsecase)),
          // override the BatchUseCase with mockbatchUseCase
          batchViewModelProvider
              .overrideWith((ref) => BatchViewModel(mockBatchUsecase)),
          // override the CourseUseCase with mockCourseUseCase
          courseViewModelProvider
              .overrideWith((ref) => CourseViewModel(mockCourseUseCase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    // use this when the page is refreshed or state changed
    await tester.pumpAndSettle();

    // find text form fields and insert values
    await tester.enterText(find.byType(TextFormField).at(0), 'sanjiv');
    await tester.enterText(find.byType(TextFormField).at(1), 'sanjiv123');

    // click on the button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

    // wait for the next frame to process the exceptions
    await tester.pump();

    // handle and acknowledge all exceptions
    dynamic exception;
    while ((exception = tester.takeException()) != null) {
      // Handle or assert on each exception if needed
      print('Caught exception: $exception');
    }

    // verify
    expect(find.text('Dashboard View'), findsOneWidget);
  });
}
