import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/batch_entity.dart';
import '../../domain/repository/batch_repository.dart';

// polymorphism 

class BatchLocalRepositoryImpl implements IBatchRepository {
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    // TODO: implement addBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    // TODO: implement getAllBatches
    throw UnimplementedError();
  }
}
