import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/course/data/repository/course_local_repository.dart';

import '../../../../core/failure/failure.dart';
import '../entity/course_entity.dart';

final courseRepositoryProvider = Provider<ICourseRepository>((ref) {
  // return local repo implementation
  // for internet connectivity we will check later
  return ref.read(courseLocalRepoProivder);
});

// interface class
abstract class ICourseRepository {
  // abstract method for getting all courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();

  // abbstract method for adding course
  Future<Either<Failure, bool>> addCourse(CourseEntity batch);
}
