import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final bool isLoading;
  final List<BatchEntity> batches;
  final List<AuthEntity>? students;
  final String? error;

  BatchState({
    this.students,
    required this.isLoading,
    required this.batches,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(
      isLoading: false,
      students: [],
      batches: [],
    );
  }

  BatchState copyWith({
    bool? isLoading,
    List<BatchEntity>? batches,
    List<AuthEntity>? students,
    String? error,
  }) {
    return BatchState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
      students: students ?? this.students,
      error: error ?? this.error,
    );
  }
}
