// For API connection : Step 6
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/api_endpoint.dart';
import 'package:hive_and_api_for_class/core/shared_prefs/user_shared_prefs.dart';
import 'package:hive_and_api_for_class/features/batch/data/dto/get_all_batch_dto.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../domain/entity/batch_entity.dart';
import '../model/batch_api_model.dart';

final batchRemoteDataSourceProvider = Provider(
  (ref) {
    return BatchRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      batchApiModel: ref.read(batchApiModelProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
    );
  },
);

class BatchRemoteDataSource {
  // dio package ==> for calling networks of HTTP requests like GET, POST, PUT, DELETE
  final Dio dio;

// creating instance of batch api model to use toJson and fromJson methods
  final BatchApiModel batchApiModel;

  final UserSharedPrefs userSharedPrefs;

  BatchRemoteDataSource(
      {required this.dio,
      required this.batchApiModel,
      required this.userSharedPrefs});

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
      if (response.statusCode == 201) {
        return const Right(true);
      }

      // if failed to POST new batch
      else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
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
      return Left(
        Failure(
          error: e.message.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    try {
      // get the token from the shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();

      data.fold((l) => token = null, (r) => token = r!);

      // delete from the server
      Response response = await dio.delete(
        ApiEndpoints.deleteBatch + batchId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // update batch by its id
  Future<Either<Failure, bool>> updateBatch(
      String batchId, BatchEntity batch) async {
    try {
      // get user token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      Response res = await dio.put(
        ApiEndpoints.updateBatch + batchId,
        data: {"batchName": batch.batchName},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (res.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: res.statusMessage.toString(),
            statusCode: res.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
            error: e.error.toString(),
            statusCode: e.response?.statusCode.toString() ?? '0'),
      );
    }
  }
}
