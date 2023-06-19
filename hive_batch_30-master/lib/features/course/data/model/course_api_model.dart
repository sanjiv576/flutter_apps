import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

final courseApiModelProvider = Provider((ref) => CourseApiModel.empty());

@JsonSerializable()
class CourseApiModel {
// mapping _id (from API) and courseId
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  CourseApiModel({
    required this.courseId,
    required this.courseName,
  });

  CourseApiModel.empty() : this(courseId: '', courseName: '');

// below code copied and pasted from course_hive_model

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to Hive Object
  CourseApiModel toHiveModel(CourseEntity entity) => CourseApiModel(
        courseId: entity.courseId,
        courseName: entity.courseName,
      );

  // List<CourseApiModel> toHiveModelList(List<CourseEntity> entities) =>
  //     entities.map((entity) => toHiveModel(entity)).toList();

  // Convert Hive List to Entity List
  List<CourseEntity> toEntityList(List<CourseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // fromJson ==> data come from API
  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  // toJson  ==> data send to API

  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);
  @override
  String toString() {
    return 'courseId: $courseId, batchName: $courseName';
  }
}
