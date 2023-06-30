import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/course/domain/entity/course_entity.dart';
import 'package:student_clean_arch/features/course/domain/repository/course_repository.dart';

import '../../../../core/failure/failure.dart';

final courseUseCaseProvider = Provider.autoDispose<CourseUseCase>((ref) {
  return CourseUseCase(courseRepository: ref.read(courseRepositoryProvider));
});

class CourseUseCase {
  final ICourseRepository
      courseRepository; // Note: courseRepo makes decision of ON or OFF wifi network

  CourseUseCase({required this.courseRepository});

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }

  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }
}
