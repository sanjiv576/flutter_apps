import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/course/data/data_source/course_remote_data_source.dart';
import 'package:hive_and_api_for_class/features/course/data/repository/course_remote_repo_impl.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

import '../../data/data_source/course_local_data_source.dart';
import '../../data/repository/course_local_repo_impl.dart';

final courseRepositoryProvider = Provider<ICourseRepository>(
    // (ref) => LocalCourseRepositoryImpl(

    //   // check whether internet connectivity

    //   // if no then, use hive database locally
    //   courseLocalDataSource: ref.read(courseLocalDataSourceProvider),

    // ),
    (ref) => CourseRemoteRepImpl(courseRemoteDataSource: ref.read(courseRemoteDataSourceProvider)),
    
);

abstract class ICourseRepository {
  Future<Either<Failure, bool>> addCourse(CourseEntity course);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
}
