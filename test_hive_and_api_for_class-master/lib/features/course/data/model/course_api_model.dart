import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:json_annotation/json_annotation.dart';

final courseApiModelProvider = Provider<CourseApiModel>(
  (ref) => CourseApiModel.empty(),
);

@JsonSerializable()
class CourseApiModel {
  @JsonKey(name: '_id')
  final String courseId;
  final String courseName;

  CourseApiModel({
    required this.courseId,
    required this.courseName,
  });

  CourseApiModel.empty()
      : courseId = '',
        courseName = '';

  factory CourseApiModel.fromJson(Map<String, dynamic> json) {
    return CourseApiModel(
      courseId: json['_id'] as String,
      courseName: json['courseName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
    };
  }

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to Hive Object
  CourseApiModel toHiveModel(CourseEntity entity) => CourseApiModel(
        courseId: entity.courseId!,
        courseName: entity.courseName,
      );

  List<CourseApiModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  // Convert Hive List to Entity List
  List<CourseEntity> toEntityList(List<CourseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'CourseApiModel(courseId: $courseId, courseName: $courseName)';
  }
}
