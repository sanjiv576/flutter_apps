
// For API connection : Step 6
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/api_endpoint.dart';
import 'package:hive_and_api_for_class/features/batch/data/dto/get_all_batch_dto.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../domain/entity/batch_entity.dart';
import '../model/batch_api_model.dart';

final batchRemoteDataSourceProvider = Provider.autoDispose(
  (ref) {
    return BatchRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      batchApiModel: ref.read(batchApiModelProvider),
    );
  },
);

class BatchRemoteDataSource {
  // dio package ==> for calling networks of HTTP requests like GET, POST, PUT, DELETE
  final Dio dio;

// creating instance of batch api model to use toJson and fromJson methods
  final BatchApiModel batchApiModel;

  BatchRemoteDataSource({required this.dio, required this.batchApiModel});

// add batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createBatch,
        data: {
          "batchName": batch.batchName,
        },
      );

      // check status
      if (response.statusCode == 200) {
        return const Right(true);
      }

      // if failed to POST new batch
      else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  // get all batches by calling the endpoint
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllBatch);

      // check the status code , if it is 200, then, convert the json object
      //and get only data then, convert model into entity list

      if (response.statusCode == 200) {
        // converting the json object from Api into Model
        GetAllBatchDTO getAllBatchDTO = GetAllBatchDTO.fromJson(response.data);

        // just for testing purpose
        // print('Batches here from API: ');
        // batchApiModel.toEntityList(getAllBatchDTO.data).map((e) => print(e));
        // convert model into entity list
        return Right(batchApiModel.toEntityList(getAllBatchDTO.data));
      }
      // if statusCode is not 200 (i.e success) like for 400, 500
      else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}
