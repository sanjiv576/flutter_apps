import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/api_endpoint.dart';
import 'package:hive_and_api_for_class/core/shared_prefs/user_shared_prefs.dart';
import 'package:hive_and_api_for_class/features/course/data/dto/get_all_course_dto.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_api_model.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../domain/entity/course_entity.dart';

final courseRemoteDataSourceProvider = Provider((ref) {
  return CourseRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    courseApiModel: ref.read(courseApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  );
});

class CourseRemoteDataSource {
  final Dio dio;
// creating instance of course api model to use toJson and fromJson methods

  final CourseApiModel courseApiModel;

  // added shared prefs
  final UserSharedPrefs userSharedPrefs;

  CourseRemoteDataSource({
    required this.dio,
    required this.courseApiModel,
    required this.userSharedPrefs,
  });

  // add course

  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createCourse,
        data: {
          "courseName": course.courseName,
        },
      );

      // check status
      if (response.statusCode == 200) {
        return const Right(true);
      }
      // if it is not successful to create new course
      else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
  // get all courses

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllCourse);
      // check the status code , if it is 200, then, convert the json object
      //and get only data then, convert model into entity list
      if (response.statusCode == 200) {
        // converting the json object from Api into Model

        GetAllCourseDTO getAllCourseDTO =
            GetAllCourseDTO.fromJson(response.data);
        // convert model into entity list

        return Right(courseApiModel.toEntityList(getAllCourseDTO.data));
      }
      // if it is not successful to get all courses
      else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

// Step 2delete
  // delete course
  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    try {
      // get the token from shared prefs
      String? token;

      Either<Failure, String?> data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      // main code to delete from server

      Response response = await dio.delete(
        // sending course id as header which means appending course id in delete route
        // i.e localhost:4000/v1/course/courseId  ==> DELETE
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
