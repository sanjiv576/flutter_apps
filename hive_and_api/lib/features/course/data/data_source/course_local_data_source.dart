import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/core/network/local/hive_service.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_hive_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

final courseLocalDataSourceProvider = Provider<CourseLocalDataSource>(
  (ref) => CourseLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    courseHiveModel: ref.read(courseHiveModelProvider),
  ),
);

class CourseLocalDataSource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalDataSource({
    required this.hiveService,
    required this.courseHiveModel,
  });
  // Add Course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      // Convert Entity to Hive Object
      final hiveCourse = courseHiveModel.toHiveModel(course);
      // Add to Hive
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      // Get from Hive
      final hiveCourses = await hiveService.getAllCourses();
      // Convert Hive Object to Entity
      final courses = courseHiveModel.toEntityList(hiveCourses);
      return Right(courses);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
