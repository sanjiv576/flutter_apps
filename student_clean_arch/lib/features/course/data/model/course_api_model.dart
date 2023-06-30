import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:student_clean_arch/features/batch/data/model/batch_api_model.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';

import '../../domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

final courseApiModelProvider = Provider((ref) => CourseApiModel.empty());

@JsonSerializable()
class CourseApiModel {
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  CourseApiModel({required this.courseId, required this.courseName});

  // initial values
  CourseApiModel.empty() : this(courseId: '', courseName: '');

  // fromJson ==> data come from API
  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  // toJson ==> send data to API
  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  // convert Hive object into entity list ==> passing data from model to entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );
  // convert Entity list into Hive Model/object
  BatchApiModel toHiveModel(BatchEntity entity) {
    return BatchApiModel(batchId: entity.batchId, batchName: entity.batchName);
  }

  // convert Hive List tot Entity list
  List<CourseEntity> toEntityList(List<CourseApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
