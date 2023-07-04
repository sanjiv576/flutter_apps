import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/config/router/app_route.dart';
import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../../test_data/batch_entity_test.dart';
import '../../../../../test_data/course_entity_test.dart';
import '../../../../unit_test/auth_unit_test.mocks.dart';
import 'login_view_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<AuthUseCase>(),
// ])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late BatchUseCase mockBatchUsecase;
  late CourseUseCase mockCourseUsecase;

  late List<BatchEntity> lstBatchEntity;
  late List<CourseEntity> lstCourseEntity;
  late StudentEntity authEntity;

  setUpAll(() async {
    mockAuthUsecase = MockAuthUseCase();
    mockBatchUsecase = MockBatchUseCase();
    mockCourseUsecase = MockCourseUseCase();

    lstBatchEntity = await getBatchListTest();
    lstCourseEntity = await getCourseListTest();

    authEntity = const StudentEntity(
      id: null,
      fname: 'Kiran',
      lname: 'Rana',
      image: '',
      phone: '1234567890',
      batch: BatchEntity(
          batchId: '20df4a89-6c95-44d0-bebf-0980c33bd49f', batchName: '30-B'),
      courses: [
        CourseEntity(
            courseId: '20df4a89-6c95-44d0-bebf-0980c33bd49f',
            courseName: 'Flutter'),
        CourseEntity(
            courseId: '278ce8eb-223c-4c4b-85ba-17dbc83f27ba', courseName: 'API')
      ],
      username: 'kiran',
      password: 'kiran123',
    );
  });

  testWidgets('register with valid details', (tester) async {
    when(mockBatchUsecase.getAllBatches())
        .thenAnswer((_) async => Right(lstBatchEntity));
    when(mockCourseUsecase.getAllCourses())
        .thenAnswer((_) async => Right(lstCourseEntity));

    when(mockAuthUsecase.registerStudent(authEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          batchViewModelProvider.overrideWith(
            (ref) => BatchViewModel(mockBatchUsecase),
          ),
          courseViewModelProvider.overrideWith(
            (ref) => CourseViewModel(mockCourseUsecase),
          ),
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockAuthUsecase),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter kiran in first textform field
    await tester.enterText(find.byType(TextFormField).at(0), 'Kiran');
    // Enter kiran123 in second textform field
    await tester.enterText(find.byType(TextFormField).at(1), 'Rana');
    // Enter phone no
    await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
    // Enter username
    await tester.enterText(find.byType(TextFormField).at(3), 'kiran');
    // Enter password
    await tester.enterText(find.byType(TextFormField).at(4), 'kiran123');

    //=========================== Find the dropdownformfield===========================

    final dropdownFinder = find.byType(DropdownButtonFormField<BatchEntity>);
    //expect(dropdownFinder, findsOneWidget);
    await tester.ensureVisible(dropdownFinder);

    await tester.tap(dropdownFinder);

    // Use this because the menu items are not visible
    await tester.pumpAndSettle();

    //tap on the first item in the dropdown
    await tester.tap(find.byType(DropdownMenuItem<BatchEntity>).at(0));
    //Use this to close the dropdown
    await tester.pumpAndSettle();

    //=========================== Find the MultiSelectDialogField===========================
    final multiSelectFinder = find.byType(MultiSelectDialogField<CourseEntity>);
    await tester.ensureVisible(multiSelectFinder);

    await tester.tap(multiSelectFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Flutter'));
    await tester.tap(find.text('API'));

    await tester.tap(find.text('OK'));

    await tester.pumpAndSettle();

    //=========================== Find the register button ===========================
    final registerButtonFinder =
        find.widgetWithText(ElevatedButton, 'Register');

    await tester.tap(registerButtonFinder);

    // await tester.pumpAndSettle();

    // expect(find.text('Successfully registered'), findsOneWidget);
  });
}
