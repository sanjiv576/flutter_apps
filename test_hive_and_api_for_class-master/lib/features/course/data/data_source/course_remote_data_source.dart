import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/api_endpoint.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/core/network/remote/http_service.dart';
import 'package:hive_and_api_for_class/core/shared_prefs/user_shared_prefs.dart';
import 'package:hive_and_api_for_class/features/course/data/dto/get_all_course_dto.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_api_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

final courseRemoteDataSourceProvider = Provider<CourseRemoteDataSource>(
  (ref) {
    return CourseRemoteDataSource(
      ref.read(httpServiceProvider),
      ref.read(userSharedPrefsProvider),
      ref.read(courseApiModelProvider),
    );
  },
);

class CourseRemoteDataSource {
  final Dio dio;
  final CourseApiModel courseApiModel;
  final UserSharedPrefs userSharedPrefs;

  CourseRemoteDataSource(this.dio, this.userSharedPrefs, this.courseApiModel);

  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.createCourse,
        data: course.toJson(),
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

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      Response response = await dio.get(ApiEndpoints.getAllCourse);
      if (response.statusCode == 200) {
        List<CourseEntity> courses = [];
        GetAllCourseDTO getAllCourseDTO =
            GetAllCourseDTO.fromJson(response.data);

        courses = courseApiModel.toEntityList(getAllCourseDTO.data);
        return Right(courses);
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

  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteCourse + courseId,
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
}
