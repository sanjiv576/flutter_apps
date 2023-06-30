import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/course_entity.dart';
import '../model/course_hive_model.dart';

// injecting hiveService and batchHiveModel in BatchLocalDataSource
// ref is used to read from another Provider to Provider

final courseLocalDataSourceProvider = Provider.autoDispose<CourseLocalDataSource>((ref) {
  return CourseLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    courseHiveModel: ref.read(courseHiveModelProvider),

    // courseHiveModel: ref.read(courseHiveModelProvider),
  );
});

class CourseLocalDataSource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalDataSource({
    required this.hiveService,
    required this.courseHiveModel,
  });

  // add course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      // convert Entity to Hive Object
      final hiveCourse = courseHiveModel.toHiveModel(course);

      // add to hive
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // get all courses
// NOte: this is conversion
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      // get all courses from Hive
      final courses = await hiveService.getAllCourses();
      // convert Hive object to Entity
      final courseEntities = courseHiveModel.toEntityList(courses);
      return Right(courseEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
