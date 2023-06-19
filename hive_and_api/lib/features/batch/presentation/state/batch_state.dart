import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final bool isLoading;
  final List<BatchEntity> batches;
  final String? error;

  BatchState({
    required this.isLoading,
    required this.batches,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(
      isLoading: false,
      batches: [],
    );
  }

  BatchState copyWith({
    bool? isLoading,
    List<BatchEntity>? batches,
    String? error,
  }) {
    return BatchState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
      error: error ?? this.error,
    );
  }
}
