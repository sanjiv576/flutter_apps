import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/course_entity.dart';
import '../../domain/repository/course_repository.dart';
import '../data_source/course_remote_data_source.dart';

final courseRemoteRepProvider = Provider.autoDispose<ICourseRepository>(
  (ref) {
    return CourseRemoteRepImpl(
      courseRemoteDataSource: ref.read(courseRemoteDataSourceProvider),
    );
  },
);

class CourseRemoteRepImpl implements ICourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRemoteRepImpl({required this.courseRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRemoteDataSource.addCourse(course);
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRemoteDataSource.getAllCourses();
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) {
    return courseRemoteDataSource.deleteCourse(courseId);
  }

  @override
  Future<Either<Failure, bool>> updateCourse(
      String courseId, CourseEntity course) {
    return courseRemoteDataSource.updateCourse(courseId, course);
  }
}
