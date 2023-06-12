import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
import 'package:student_clean_arch/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

// for generating Adapter for solving Binary Form problem, Note: give name file name
part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  // giving index 0 for id column
  @HiveField(0)
  final String? courseId;

// giving index 1 for batchName column
  @HiveField(1)
  String? courseName;

  // empty constructor
  CourseHiveModel.empty() : this(courseId: '', courseName: '');

  CourseHiveModel({
    String? courseId,
    required this.courseName,
    // insert batch id that is given from UI otherwise if it is null, then, generate id using Uuid
  }) : courseId = courseId ?? const Uuid().v4();

  // convert Hive Object to Entity ==> passing data from Model to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName!,
      );

  // convert Entity to Hive Object ==> passing data from Entity to Model and conversion
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        // courseId: courseId,
        courseName: courseName,
      );

  // convert Hive List to Entity List
  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'courseId: $courseId, courseName: $courseName';
  }

  // @HiveField(0)
  // final String courseId;

  // @HiveField(1)
  // final String courseName;

  // // empty constructor
  // CourseHiveModel.empty() : this(courseId: '', courseName: '');

  // CourseHiveModel({
  //   String? courseId,
  //   required this.courseName,
  // }) : courseId = courseId ?? const Uuid().v4();

  // // Convert Hive Object to Entity
  // CourseEntity toEntity() => CourseEntity(
  //       courseId: courseId,
  //       courseName: courseName,
  //     );

  // // Convert Entity to Hive Object
  // CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
  //       // courseId: entity.courseId,
  //       courseName: entity.courseName,
  //     );

  // // Convert Hive List to Entity List
  // List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
  //     models.map((model) => model.toEntity()).toList();

  // List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
  //     entities.map((entity) => toHiveModel(entity)).toList();

  // @override
  // String toString() {
  //   return 'courseId: $courseId, courseName: $courseName';
  // }
}
