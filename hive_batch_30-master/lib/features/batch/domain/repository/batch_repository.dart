import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/batch/data/repository/batch_remote_repo_impl.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

import '../../data/data_source/batch_remote_data_source.dart';

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  // Return Local repository implementation
  // For internet connectivity we will check later

  // return ref.read(batchLocalRepoProvider);

  // return ref.read(batchRemoteRepoProvider);
// For API connection : Step 8
  // if the interent is available then, read from API
  return BatchRemoteRepoImpl(batchRemoteDataSource: ref.read(batchRemoteDataSourceProvider));
});

abstract class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
  Future<Either<Failure, bool>> deleteBatch(String batchId);
  Future<Either<Failure, bool>> updateBatch(String batchId, BatchEntity batch);
}
