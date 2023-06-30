import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/core/failure/failure.dart';
import 'package:student_clean_arch/features/course/data/data_sources/course_remote_data_source.dart';
import 'package:student_clean_arch/features/course/domain/entity/course_entity.dart';
import 'package:student_clean_arch/features/course/domain/repository/course_repository.dart';

final courseRemoteRepoImplProvider = Provider.autoDispose((ref) {
  return CourseRemoteRepoImp(
    courseRemoteDataSource: ref.read(courseRemoteDataSourceProvider),
  );
});

class CourseRemoteRepoImp implements ICourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;
  CourseRemoteRepoImp({required this.courseRemoteDataSource});
  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity batch) {
    // TODO: implement addCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRemoteDataSource.getAllCourse();
  }
}
