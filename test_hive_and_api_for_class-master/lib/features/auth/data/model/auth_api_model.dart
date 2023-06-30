import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/batch/data/model/batch_api_model.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/student_entity.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return AuthApiModel(
    fname: '',
    lname: '',
    phone: '',
    course: [],
    username: '',
    password: '',
  );
});

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? studentId;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final BatchApiModel? batch;
  final List<CourseApiModel> course;
  final String username;
  final String? password;

  AuthApiModel({
    this.studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    this.batch,
    required this.course,
    required this.username,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // convert AuthApiModel to AuthEntity
  AuthEntity toEntity() => AuthEntity(
        id: studentId,
        fname: fname,
        lname: lname,
        image: image,
        phone: phone,
        batch: batch?.toEntity(),
        courses: course.map((e) => e.toEntity()).toList(),
        username: username,
        password: password ?? '',
      );

  // Convert AuthApiModel list to AuthEntity list
  List<AuthEntity> listFromJson(List<AuthApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel(id: $studentId, fname: $fname, lname: $lname, image: $image, phone: $phone, batch: $batch, courses: $course, username: $username, password: $password)';
  }
}
