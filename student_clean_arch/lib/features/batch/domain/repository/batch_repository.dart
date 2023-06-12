import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/batch_entity.dart';
// interface class
abstract class IBatchRepository {
  // abstract method for getting all batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();

  // abbstract method for adding batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
