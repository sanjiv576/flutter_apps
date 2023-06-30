import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/config/constants/api_endpoint.dart';
import 'package:student_clean_arch/core/failure/failure.dart';
import 'package:student_clean_arch/core/network/remote/http_service.dart';
import 'package:student_clean_arch/features/batch/data/dto/get_all_batch_dto.dart';
import 'package:student_clean_arch/features/batch/data/model/batch_api_model.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';

final batchRemoteDataSourceProvider = Provider.autoDispose(
  (ref) => BatchRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    batchApiModel: ref.read(batchApiModelProvider),
  ),
);

class BatchRemoteDataSource {
  final Dio dio;
  final BatchApiModel batchApiModel;

  BatchRemoteDataSource({required this.dio, required this.batchApiModel});

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      // data comes from API
      Response response = await dio.get(ApiEndpoints.getAllBatch);

      if (response.statusCode == 200) {
        // convert Json objects from API into Model
        GetAllBatchDTO getAllBatchDTO = GetAllBatchDTO.fromJson(response.data);
        // convert Model into Entity list and return
        return Right(batchApiModel.toEntityList(getAllBatchDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
            error: e.error.toString(),
            statusCode: e.response?.statusMessage.toString() ?? '0'),
      );
    }
  }
}
