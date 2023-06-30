import 'package:hive_and_api_for_class/features/batch/data/model/batch_api_model.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_student_model.g.dart';

@JsonSerializable()
class BatchStudentModel {
  @JsonKey(name: '_id')
  final String? studentId;
  final String fname;
  final String lname;
  final String image;
  final String username;
  final BatchApiModel batch;
  final List<CourseApiModel> course;

  BatchStudentModel({
    this.studentId,
    required this.fname,
    required this.lname,
    required this.image,
    required this.username,
    required this.batch,
    required this.course,
  });

  factory BatchStudentModel.fromJson(Map<String, dynamic> json) =>
      _$BatchStudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$BatchStudentModelToJson(this);
}
