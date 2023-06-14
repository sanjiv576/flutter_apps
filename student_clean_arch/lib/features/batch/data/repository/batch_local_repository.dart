import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/batch/data/data_sources/batch_local_data_source.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/batch_entity.dart';
import '../../domain/repository/batch_repository.dart';

final batchLocalRepoProvider = Provider<IBatchRepository>(
  (ref) {
    return BatchLocalRepositoryImpl(
      batchLocalDataSource: ref.read(batchLocalDataSourceProvider),
    );
  },
);

// polymorphism

class BatchLocalRepositoryImpl implements IBatchRepository {
  final BatchLocalDataSource batchLocalDataSource;

  BatchLocalRepositoryImpl({
    required this.batchLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchLocalDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchLocalDataSource.getAllBatches();
  }
}
