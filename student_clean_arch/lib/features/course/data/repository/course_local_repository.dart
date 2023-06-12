import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/course_entity.dart';
import '../../domain/repository/course_repository.dart';

class CourseLocalRepositoryImpl implements ICourseRepository {
  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity batch) {
    // TODO: implement addCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    // TODO: implement getAllCourses
    throw UnimplementedError();
  }
}
