import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../domain/entity/student_entity.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) {
    return AuthRemoteDataSource(dio: ref.read(httpServiceProvider));
  },
);

// Step 4camera
class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource({required this.dio});

  Future<Either<Failure, bool>> registerStudent(StudentEntity student) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fname": student.fname,
          "lname": student.lname,
          "image": student.image,
          "username": student.username,
          "password": student.password,
          "batch": student.batch!.batchId,
          // "course": ["6489a5908dbc6d39719ec19c", "6489a5968dbc6d39719ec19e"]
          "course": student.courses.map((e) => e.courseId).toList(),
        },
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

  // Upload image using multipart
  Future<Either<Failure, String>> uploadProfilePicture(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      return Right(response.data["data"]);
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
