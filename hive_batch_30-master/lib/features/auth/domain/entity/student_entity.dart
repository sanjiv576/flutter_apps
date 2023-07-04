import 'package:equatable/equatable.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

class StudentEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final String? image;
  final BatchEntity? batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const StudentEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    this.batch,
    this.image,
    required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, fname, lname, phone, batch, image, courses, username, password];
}
