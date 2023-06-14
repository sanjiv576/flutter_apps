// tells where the changes occur
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:student_clean_arch/features/batch/domain/use_case/batch_use_case.dart';
import 'package:student_clean_arch/features/batch/presentation/state/batch_state.dart';

// StateNotifierProvider is used here because we use StateNotifier (look in BatchViewModel class)
final batchViewModelProvider =
    StateNotifierProvider<BatchViewModel, BatchState>(
  (ref) => BatchViewModel(ref.read(batchUseCaseProvider)),
);


// class
class BatchViewModel extends StateNotifier<BatchState> {
  final BatchUseCase batchUseCase;

  BatchViewModel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

// Never returns any thing here, we all do in batchState
  Future<void> addBatch(BatchEntity batch) async {
    state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
      (left) => state = state.copyWith(
          isLoading: false, error: left.error), // here comes failure
      (right) => state = state.copyWith(
          isLoading: false, error: null), // here comes bool value
    );
  }

  Future<void> getAllBatches() async {
    state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold(
      (left) => state = state.copyWith(isLoading: false, error: left.error), // here comes failure 
      (right) => state = state.copyWith(isLoading: false, batches: right),  // here comes list of batches
    );
  }
}
