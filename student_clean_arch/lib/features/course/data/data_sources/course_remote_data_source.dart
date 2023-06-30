import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/config/constants/api_endpoint.dart';
import 'package:student_clean_arch/core/failure/failure.dart';
import 'package:student_clean_arch/core/network/remote/http_service.dart';
import 'package:student_clean_arch/features/course/data/dto/get_all_course_dto.dart';
import 'package:student_clean_arch/features/course/data/model/course_api_model.dart';
import 'package:student_clean_arch/features/course/domain/entity/course_entity.dart';

final courseRemoteDataSourceProvider = Provider((ref) {
  return CourseRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    courseApiModel: ref.read(courseApiModelProvider),
  );
});

class CourseRemoteDataSource {
  final Dio dio;
  final CourseApiModel courseApiModel;

  CourseRemoteDataSource({required this.dio, required this.courseApiModel});

  Future<Either<Failure, List<CourseEntity>>> getAllCourse() async {
    try {
      Response response = await dio.get(ApiEndpoints.getAllCourse);

      if (response.statusCode == 200) {
        // convert JSON object from API into Model
        GetAllCourseDTO getAllCourseDTO =
            GetAllCourseDTO.fromJson(response.data);
        // convert Model into Entity
        return Right(courseApiModel.toEntityList(getAllCourseDTO.data));
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
            statusCode: e.response?.statusCode.toString() ?? '0'),
      );
    }
  }
}
