import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/batch_entity_test.dart';
import 'batch_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BatchUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  // initialize all necessary things before executing tests
  TestWidgetsFlutterBinding.ensureInitialized();
  late BatchUseCase mockBatchUseCase;
  late List<BatchEntity> batchList;
  late ProviderContainer container;
  late BuildContext mockBuildContext;

  setUpAll(() async {
    mockBatchUseCase = MockBatchUseCase();
    // mockBuildContext = MockBuildContext();

    batchList = await getBatchListTest();
    // get empty batches at initial stage
    when(mockBatchUseCase.getAllBatches())
        .thenAnswer((_) => Future.value(const Right([])));
    container = ProviderContainer(overrides: [
      batchViewModelProvider
          .overrideWith((ref) => BatchViewModel(mockBatchUseCase))
    ]);
  });

  test('check initial state of batch', () {
    // call above stub
    final batchState = container.read(batchViewModelProvider);

    // verify the batch list is empty
    expect(batchState.batches, isEmpty);
  });

  test('get all batches and check the length of batch state', () async {
    when(mockBatchUseCase.getAllBatches())
        .thenAnswer((_) => Future.value(Right(batchList)));

// call above stub
    await container.read(batchViewModelProvider.notifier).getAllBatches();

    final batchState = container.read(batchViewModelProvider);

    expect(batchState.batches, isNotEmpty);
  });

  // test('add batch', () async {
  //   when(mockBatchUseCase.addBatch(batchList[0]))
  //       .thenAnswer((_) => Future.value(const Right(true)));

  //   // add first index value of batchList
  //   await container
  //       .read(batchViewModelProvider.notifier)
  //       .addBatch(batchList[0], mockBuildContext);

  //   final batchState = container.read(batchViewModelProvider);

  //   // now, the error should be null, if it is added successfully
  //   expect(batchState.error, isNull);
  // });

  tearDownAll(() => container.dispose());
}
