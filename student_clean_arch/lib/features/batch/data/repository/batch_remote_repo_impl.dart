import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/core/failure/failure.dart';
import 'package:student_clean_arch/features/batch/data/data_sources/batch_remote_data_source.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:student_clean_arch/features/batch/domain/repository/batch_repository.dart';

final batchRemoteRepoImplProvider = Provider.autoDispose((ref) {
  return BatchRemoteRepoImpl(
    batchRemoteDataSource: ref.read(batchRemoteDataSourceProvider),
  );
});

class BatchRemoteRepoImpl implements IBatchRepository {
  final BatchRemoteDataSource batchRemoteDataSource;

  BatchRemoteRepoImpl({required this.batchRemoteDataSource});
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    // TODO: implement addBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRemoteDataSource.getAllBatches();
  }
}
