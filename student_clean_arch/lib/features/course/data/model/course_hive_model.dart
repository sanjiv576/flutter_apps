import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
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
}
