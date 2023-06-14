import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/batch_entity.dart';
import '../repository/batch_repository.dart';

final batchUseCaseProvider = Provider<BatchUseCase>((ref) {
  return BatchUseCase(batchRepository: ref.read(batchRepositoryProvider));
});

class BatchUseCase {
  final IBatchRepository
      batchRepository; // Note: batchRepo makes decision of ON or OFF wifi network

  BatchUseCase({required this.batchRepository});

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRepository.getAllBatches();
  }

  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRepository.addBatch(batch);
  }
}
