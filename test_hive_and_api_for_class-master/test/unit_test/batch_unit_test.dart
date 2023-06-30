import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/batch_entity_test.dart';
import 'batch_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BatchUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late BatchUseCase mockBatchUsecase;
  late List<BatchEntity> batchEntity;

  // command : dart run build_runner build --delete-conflicting-outputs

  setUpAll(() async {
    // NOte: run this dart run build_runner build --delete-conflicting-outputs otherwise error comes in MockBatchUseCase()
    mockBatchUsecase = MockBatchUseCase();
    // getting BatchList data from dummy json i.e batch_entity_test.dart
    batchEntity = await getBatchListTest();

    when(mockBatchUsecase.getAllBatches())
        // overriding the constructor of batch viewmodel
        .thenAnswer((_) async => const Right([]));

    container = ProviderContainer(
      overrides: [
        batchViewModelProvider.overrideWith(
          (ref) => BatchViewModel(mockBatchUsecase),
        )
      ],
    );
  });

// this test doesnt count for final exam
  test('check batch inital state', () {
    final batchState = container.read(batchViewModelProvider);

    expect(batchState.isLoading, true);
    // Note: we can use length as well instead of isEmpty
    expect(batchState.batches, isEmpty);
    expect(batchState.students, isEmpty);
  });

  test('check for the list of batches when calling getAllBatches', () async {
    when(mockBatchUsecase.getAllBatches())
        // acutal dummy data of batch
        .thenAnswer((_) => Future.value(Right(batchEntity)));

    await container.read(batchViewModelProvider.notifier).getAllBatches();

    final batchState = container.read(batchViewModelProvider);
    expect(batchState.isLoading, false);

    // 4 is here because we have only 4 lenght of data from batch list
    expect(batchState.batches.length, 4);
  });

  test('add the batch entity and return true if successfully added', () async {
    BatchEntity newBatch = const BatchEntity(batchName: 'R-45');
    when(mockBatchUsecase.addBatch(newBatch))
        .thenAnswer((_) => Future.value(const Right(true)));
    await container.read(batchViewModelProvider.notifier).addBatch(newBatch);

    final batchState = container.read(batchViewModelProvider);
    expect(batchState.error, isNull);
  });
  test('add the batch with error', () async {
    BatchEntity newBatch = const BatchEntity(batchName: 'R-45');
    when(mockBatchUsecase.addBatch(newBatch))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Not added'))));
    await container.read(batchViewModelProvider.notifier).addBatch(newBatch);

    final batchState = container.read(batchViewModelProvider);
    expect(batchState.error, isNotNull);
  });

  // should fail below test

   test('add the batch with error', () async {
    BatchEntity newBatch = const BatchEntity(batchName: 'R-45');
    when(mockBatchUsecase.addBatch(newBatch))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Not added'))));
    await container.read(batchViewModelProvider.notifier).addBatch(newBatch);

    final batchState = container.read(batchViewModelProvider);
    expect(batchState.error, isNull);
  });
}
