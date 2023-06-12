import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entity/course_entity.dart';

// interface class
abstract class ICourseRepository {
  // abstract method for getting all courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();

  // abbstract method for adding course
  Future<Either<Failure, bool>> addCourse(CourseEntity batch);
}
