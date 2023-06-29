import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/state/batch_state.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

final batchViewModelProvider =
    StateNotifierProvider<BatchViewModel, BatchState>(
  (ref) => BatchViewModel(ref.read(batchUsecaseProvider)),
);

class BatchViewModel extends StateNotifier<BatchState> {
  final BatchUseCase batchUseCase;

  BatchViewModel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

  addBatch(BatchEntity batch, BuildContext context) async {
    state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showSnackBar(
          message: 'Error: ${l.error}',
          context: context,
          color: Colors.red,
        );
      },
      (r) {
        // add new batch in the state as well
        state.batches.add(batch);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'New batch added successfully',
          context: context,
        );
      },
    );
  }

  getAllBatches() async {
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, batches: r, error: null),
    );
  }

  Future<void> deleteBatch(BuildContext context, BatchEntity batch) async {
    state = state.copyWith(isLoading: true);

    var data = await batchUseCase.deleteBatch(batch.batchId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // remove that course only from the state
        state.batches.remove(batch);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Batch delete successfully',
          context: context,
        );
      },
    );
  }

  Future<void> updateBatch(String batchId, BatchEntity batch) async {
    state = state.copyWith(isLoading: true);

    var data = await batchUseCase.updateBatch(batchId, batch);

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      // remove from the list
      state.batches.removeWhere((batch) => batch.batchId == batchId);
      // append the updated batch in the list
      state.batches.add(batch);
      // off the loading
      state = state.copyWith(isLoading: false, error: null);
    });
  }
}
