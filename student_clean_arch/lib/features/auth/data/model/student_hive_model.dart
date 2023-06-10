import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../../batch/data/model/batch_hive_model.dart';
import '../../../course/data/model/course_hive_model.dart';

part 'student_hive_model.g.dart';

// run this command in terminal, if there any changes in this file
// dart run build_runner build --delete-conflicting-outputs

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHiveModel {
  @HiveField(0)
  final String studentId;
  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final BatchHiveModel batch; // store whole batch instead of its id
  @HiveField(5)
  final List<CourseHiveModel> courses;
  @HiveField(6)
  final String username;
  @HiveField(7)
  final String password;

  // constructor
  StudentHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // empty constructor
  StudentHiveModel.empty()
      : this(
            batch: BatchHiveModel.empty(),
            courses: [],
            studentId: '',
            fname: '',
            lname: '',
            phone: '',
            username: '',
            password: '');
}
