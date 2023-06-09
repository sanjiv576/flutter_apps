import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/batch/data/repository/batch_local_repository.dart';
import 'package:student_clean_arch/features/batch/data/repository/batch_remote_repo_impl.dart';

import '../../../../core/failure/failure.dart';
import '../entity/batch_entity.dart';

final batchRepositoryProvider = Provider.autoDispose<IBatchRepository>((ref) {
  // return local repo implementation
  // for internet connectivity we will check later
  // return ref.read(batchLocalRepoProvider);
  return ref.read(batchRemoteRepoImplProvider);
});

// interface class
abstract class IBatchRepository {
  // abstract method for getting all batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();

  // abstract method for adding batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
